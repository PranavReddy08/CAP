using { managed,temporal, Country,Currency} from '@sap/cds/common';
namespace demo;
entity Customer: managed,temporal{
    key CID : UUID;
    key CustomerID : Integer;
    Name : String;
    city : String;
    country : Country;
    Order : Association to many Orders on Order.CustomerID =CustomerID;
    validFrom :Timestamp;
    validTo :Timestamp;

}
entity Orders{
    key OrderID: Integer;
    CustomerID: Integer;
    Status : String;
    OrderDate :Date;
    Orderinfo : Association to many OrderItems on Orderinfo.OrderID = OrderID;
}
entity OrderItems @Capabilities.Insertable {
    key ProductID: Integer;
    OrderID : Integer;
    Product : String;
    Quantity :Integer;
    NetAmount : Integer;
    Currency : Currency;
    to_order : Association to one Orders on to_order.OrderID = OrderID;

}


