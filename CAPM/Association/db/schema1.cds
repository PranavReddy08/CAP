
namespace set1;

// Tab1 entity
entity Tab1 {
    key id   : Integer;
    name     : String;
    details : Association to many Tab2 on details.empid = id;
}

// Tab2 entity
entity Tab2 {
    key empid: Integer;
    deptid   : Integer;
    dept     : String;

  
}
