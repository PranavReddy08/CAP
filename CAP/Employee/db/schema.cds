namespace ust.employees;

context master{
entity Department {
  key ID       : UUID;
  name         : String(60);
  description  : String(100);
  employees    : Association to many Employee on employees.department = $self;
}

entity Role {
  key ID       : UUID;
  name         : String(50);
  level        : Integer;
  employees    : Association to many Employee on employees.role = $self;
}

entity Employee {
  key ID        : UUID;
  firstName     : String(50);
  lastName      : String(50);
  email         : String(100);
  joinDate      : Date;
  status        : String(20);

  department    : Association to Department;
  role          : Association to Role;

  attendances   : Association to many transaction.Attendance on attendances.employee = $self;
  salaries      : Association to many transaction.EmployeeSalary on salaries.employee = $self;
  leaves        : Association to many transaction.EmployeeLeave on leaves.employee = $self;
}
}

// ----------------------------
// Transaction Entities
// ----------------------------
context transaction{
entity Attendance {
  key ID          : UUID;
  date            : Date;
  checkIn         : Time;
  checkOut        : Time;

  employee        : Association to master.Employee;
}

entity EmployeeLeave {
  key ID          : UUID;
  leaveType       : String(40);
  startDate       : Date;
  endDate         : Date;
  status          : String(20);

  employee        : Association to master.Employee;
}

entity EmployeeSalary {
  key ID          : UUID;
  month           : String(20);
  year            : Integer;
  amount          : Decimal(12,2);

  employee        : Association to master.Employee;
}
}