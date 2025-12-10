namespace cdsview;
using ust.demo from './demo';

define view StudentView as select
from demo.master.student
{
    key id as ![StudentID],
    firstName as ![FirstName],
    lastName as ![LastName],
    dob as ![DOB]
  
};

define view ValueHelp as select
from demo.master.student{
    // key id as ![Student ID],
    // firstName as ![Firstname],
       @EndUserText.label:[
            {
                language: 'EN',
                text: 'Student ID'
            },
            {
                language: 'DE',
                text: 'Studentenausweis'
            }
        ]
        id as![StudentID],
        @EndUserText.label:[
            {
                language: 'EN',
                text: 'Name'
            },
            {
                language: 'DE',
                text: 'Vorname'
            }
        ]
        firstName as![FirstName]
};

define view StudentEnrolls as select from demo.master.student
mixin{
     Enrolled: Association to StudentView on Enrolled.StudentID = $projection.StudentID
}
into {
    student.id as ![StudentID],
    Enrolled as ![to_enrolls]

    
}