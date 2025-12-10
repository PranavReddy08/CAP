namespace ust.demo;
using { cuid,managed,temporal } from '@sap/cds/common';


context master{
    entity student {
        key id : Integer;
        firstName: String(20);
        lastName :String(20);
        dob :Date;
        class: Association to semester;
 
        
    }

    entity semester{
        key id:Integer;
        name:String;
        specialization:String;
        HOD:String
    }
}
context transaction{
    entity enroll:cuid,managed,temporal{
      student:Association to master.student;
      semester:Association to master.semester;
    }
}