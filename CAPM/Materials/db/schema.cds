namespace demo;
entity Materials{
   key MaterialID : Integer;
   MaterialCode :String;
   MaterialDesc : String;
   UOM: String;
   MaterialType:String;
   StorageLocation:String;
   Status:String;
   details : Association to GoodsMovements on details.MaterialID=MaterialID;



};
entity GoodsMovements{
    key MovementID : Integer;
    MaterialID : Integer;
    MovementType:String;
    Plant : String;
    RefDocType : String;
    UserID:Integer;
    Remarks : String;

}

