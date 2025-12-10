using demo from '../db/schema';
define service  Myservice 
@(restrict :[
    {grant:['READ','WRITE'], to:'Admin'},
    {grant:['READ'],to:'User'}
])
{
    entity Equipment as projection on demo.Equipment;
   
    entity MaintenanceOrders as projection on demo.MaintenanceOrders; 
}
