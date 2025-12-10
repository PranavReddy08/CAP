const cds = require('@sap/cds');
const {SELECT,UPDATE} = cds.ql

module.exports = cds.service.impl(function () {

  const { student } = this.entities;

  this.on('Boost', async (req) => {

    const { id } = req.data;       // integer id from action call
    

    // Update student
    await UPDATE(student)
      .set({ firstName: "JHON" })
      .where({ id });

    // Return updated record
    const updated = await SELECT.from(student).where({ id });

    return updated;

  });
//  const {SELECT} = cds.ql
//   this.before('READ',student,async req=>{
//     const id = req.data.id
//     const res = await SELECT.one.from(student).where({id})
//     console.log(res)

//   })

});
