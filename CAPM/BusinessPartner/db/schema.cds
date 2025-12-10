namespace bpso;

entity BusinessPartner {
    key BPID : Integer;
    BPName : String;
    BPType : String;
    Country : String;
    City : String;

    // Correct association syntax
    display : Association to many SalesOrder on display.BP_ID = BPID;
}

entity SalesOrder {
    key SOID : Integer;
    BP_ID : Integer;
    SODate : Date;
    Currency : String;
    NetAmount : Integer;
    Status : String;
}
