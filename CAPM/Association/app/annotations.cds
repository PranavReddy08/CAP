
// annotate MyService.Tab1 with @(UI : {
//   LineItem : [
//     { Value: id, Label: 'ID' },
//     { Value: name, Label: 'Name' },
//     { Value: details, Label: 'Details', ![@UI.NavigationTarget]: 'Tab2' }
//   ]
// });

// annotate MyService.Tab2 with @(UI : {
//   LineItem : [
//     { Value: empid, Label: 'Employee ID' },
//     { Value: deptid, Label: 'Department ID' },
//     { Value: dept, Label: 'Department' }
//   ],
//   Identification : [
//     { Value: empid },
//     { Value: deptid },
//     { Value: dept }
//   ]
// });
