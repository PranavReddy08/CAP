using demo from '../db/schema';
service MyService @(restrict :[
    {grant:['READ','WRITE'], to:'Admin'},
    {grant:['READ'],to:'User'}
]){
    
    @UI.LineItem :[
        {Value:CustomerID,Label:'Customer ID'},
        {Value:Name,Label:'Customer Name'},
        {Value:city,Label:'City'}
    ]
    @UI.Facets:[
        {$Type:'UI.ReferenceFacet',Target:'Order/@UI.LineItem',Label:'Order Details'},
        
    ]
    entity Customer as projection on demo.Customer;
    @UI.LineItem :[
        {Value:OrderID,Label:'Order ID'},
        {Value:OrderDate,Label:'Order Date'},
        {Value:Status,Label:'Status'}
    ]
     @UI.Facets:[
        {$Type:'UI.ReferenceFacet',Target:'Orderinfo/@UI.LineItem',Label:'Customer Details'}
    ]


    entity Orders as projection on demo.Orders;
     @UI.LineItem :[
        {Value:ProductID,Label:'Order ID'},
        {Value:Product,Label:'Order Date'},
        
    ]
     @UI.Identification :[
        {Value:to_order.OrderID,Label:'Order ID'},
        {Value:to_order.OrderDate,Label:'Order Date'},
        
    ]

     @UI.Facets:[
        {$Type:'UI.ReferenceFacet',Target:'@UI.Identification',Label:'Customer Details'}
    ]
    
    

    entity OrderItems as projection on demo.OrderItems;

    

}