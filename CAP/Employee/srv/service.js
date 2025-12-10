const cds = require('@sap/cds');
const { SELECT, UPDATE, INSERT } = require('@sap/cds/lib/ql/cds-ql');
module.exports=cds.service.impl(function(){
    const {Employee,Department,Attendance,Salary} = this.entities();
    this.on('getlastactive', req => {
        const inputDate = new Date(req.data.date);
        const today = new Date();
        const diffMs = today - inputDate;          // difference in milliseconds
        const diffDays = Math.floor(diffMs / (1000 * 60 * 60 * 24)); // convert to days
        return diffDays;  // integer
    });
    this.before('CREATE',Employee,async req=>{
        const email = req.data.email;
        const emailRegex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
        const valid = emailRegex.test(email);
        console.log(valid);
        if (valid === false){
            req.error(500,'Enter a valid Email')
        }

    })

     this.before('DELETE', Department, async req => {
        const ID = req.data.ID;
        const employee = await SELECT.one.from(Employee).where({ department_ID: ID });
        console.log("Employee found:", employee);
        if (employee) {
        req.error(400, "You cannot delete this department because employees exist under it.");
        }
    });
    this.after('READ', Employee, async (data, req) => {
    const today = new Date();

    // READ may return a single object or an array
    const employees = Array.isArray(data) ? data : [data];

    for (const emp of employees) {

        // Only process active employees
        if (emp.status !== 'Active') continue;

        // Get latest attendance
        const lastday = await SELECT.one
            .from(Attendance)
            .columns('date')
            .where({ employee_ID: emp.ID })
            .orderBy('date desc');

        // If no attendance → skip or directly mark inactive
        if (!lastday) {
            console.log("No attendance for:", emp.ID);
            continue;
        }

        const last = new Date(lastday.date);

        const diff = Math.floor((today - last) / (1000 * 60 * 60 * 24));

        console.log("Emp:", emp.ID, "Days:", diff);

        // If more than 30 days → update status
        if (diff > 30) {
            await UPDATE(Employee)
                .set({ status: 'Inactive' })
                .where({ ID: emp.ID });
        }
    }
});
    // this.after('READ',Employee,async (req)=>{
    //     const today =new Date();
    //     const active = await SELECT.from(Employee).columns('ID').where({status:'Active'});
    //     // console.log(active);
    //     for (const emp of active){
    //         // console.log(emp.ID);
    //         let lastday = await SELECT.one.from(Attendance).columns('date').where({employee_ID:emp.ID}).orderBy('date desc');
    //         // console.log(lastday);
    //         let last = new Date(lastday.date);
    //         let diff = Math.floor((today - last) / (1000 * 60 * 60 * 24));
    //         // console.log(diff);
    //         if ( diff > 30){
    //             await UPDATE(Employee).set({status:'Inactive'}).where({ID:emp.ID})
    //         }

    //     }




    //     // const latestAttendance = await SELECT.one.from(Attendance)
    //     //     .where({ 'employee_ID': data.ID })
    //     //     .orderBy('date desc');
    //     // console.log(data.ID, latestAttendance);
    // })





    this.before('CREATE',Attendance,req=>{
        const checkin =req.data.checkIn;
        const checkout =req.data.checkOut;
        const timetomin = (timings)=>{
            const [h,m,s] = timings.split(':').map(Number);
            return h*60 + m + s /60;
        };
        const intime = timetomin(checkin);
        const outtime =timetomin(checkout);
        const diff = outtime-intime;
        console.log(diff);
        if (diff < 480){
            req.error(500,'you should be in office for atleast 8 hrs')
        }
    })

    this.after('CREATE', 'Employee', async (data, req) => {
    const ID = data.ID; // <-- use 'data', not 'req.data'

    const now = new Date();
    const month = now.toLocaleString('default', { month: 'long' });
    const year = now.getFullYear();

    // INSERT salary row
    await INSERT.into(Salary).entries({
        employee_ID: ID,
        month: month,
        year: year,
        amount: 0.00
    });

    console.log(`Salary row created for employee ${ID} for ${month} ${year}`);
});

     //Bound action for employee for set Status
     this.on('setStatus',async req=>{
        const ID = req.params[0];
        console.log(ID)
        const sta = await SELECT.one.from(Employee).where({ID});
        console.log(sta)
        return 'Active';
     })

})