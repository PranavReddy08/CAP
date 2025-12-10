using set1 from '../db/schema1';

service MyService {
  entity Tab1 as projection on set1.Tab1 {
    id,
    name,
    details
  };

  entity Tab2 as projection on set1.Tab2 {
    empid,
    deptid,
    dept
  };
}



        
    

