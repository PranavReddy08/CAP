using ust.demo from '../db/demo';
using cdsview from '../db/CDSview';
service studentService {
    action Boost(id:Integer) returns student;
    // function greet(name :String(20)) returns String;
   entity student as projection on demo.master.student {
     *
    // case firstName
    //     when 'jhon' then 'JHON'
    //     when 'imran' then 'IMRAN'
    //     when 'ram' then 'RAM'
    // end as first:String(10),
    // case firstName
    //     when 'jhon' then 1
    //     when 'imran' then 5
    //     when 'ram' then 2
    // end as colourCode:Integer,
    
};
    entity semester as projection on demo.master.semester;
    entity enroll as projection on demo.transaction.enroll;
    // action Boost(id:Integer) returns student;
    @cds.redirection.target
    entity StudentView  as projection on cdsview.StudentView;
    entity StudentEnrolls as projection on cdsview.StudentEnrolls;
    entity ValueHelp as projection on cdsview.ValueHelp;
   

    

}
