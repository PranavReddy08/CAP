namespace demo;
entity PurchaseOrders{
    key POID : Integer;
    VendorID : Integer;
	Plant : String;
    POType : String;
    POStatus : String;
    CreatedBy : Date;
    Remarks : String;
    details :Association to BusinessPartners on details.BPID = VendorID;

};
entity BusinessPartners {
   key  BPID : Integer;
   	BPName: String;
    BPType :String;
    Country :String;
	City : String;
    Phone : String;
    Email : String
    
}