namespace demo;
using { managed } from '@sap/cds/common';


entity Equipment : managed{
    key EquipID : String;
    Description : localized String;
    Plant : String;
    @UI.IsImageURL:true
    image : String;
    Status :String;
    details : Association to many MaintenanceOrders on  details.EquipID=EquipID;
}

entity MaintenanceOrders{
    key MOID : Integer;
    EquipID : String;
    Priority : String;
    StartDate : Date;
    EndDate :Date;
    Status :String;
    Cost : Integer
}