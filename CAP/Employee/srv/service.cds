using {ust.employees} from  '../db/schema';

service employee{
     

action setStatus(ID : UUID) returns String;
    
entity Employee as projection on employees.master.Employee {
  *,
  @Computed: true
  CASE
    WHEN status = 'Active' THEN 3
    WHEN status = 'Inactive' THEN 2
    ELSE 1
  END as statusCode : Integer
}

    entity Department as projection on employees.master.Department;
    entity Role as projection on employees.master.Role;
    entity Attendance as projection on employees.transaction.Attendance;
    entity Leaves as projection on employees.transaction.EmployeeLeave;
    entity Salary as projection on employees.transaction.EmployeeSalary;
   
}