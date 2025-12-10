using demo from '../db/schema';
service MyService {
    @odata.draft.enabled:true
    @UI.HeaderInfo:{
        TypeName : '{i18n>PurchaseOrder}',
        TypeNamePlural :'{i18n>PurchaseOrders}',
        Title : 'PurchaseOrderInformation',
        Description : {Value : details.BPID}

    }

    @UI.LineItem  : [
        {Value:VendorID , Label:'{i18n>VendorID}'},
        {Value:POID,Label:'{i18n>POID}'},
        {Value:POType,Label:'{i18n>potype}'},
        {Value:POStatus,Label:'{i18n>Status}'}
        
    ]

    @UI.Identification :[
        {Value:details.BPID,Label:'{i18n>BPID}'},
        {Value:details.BPName,Label:'{i18n>BPname}'},
        {Value:details.BPType,Label:'{i18n>BPType}'},
        {Value:details.Country,Label:'{i18n>Country}'},
        {Value:details.City,Label:'{i18n>City}'}
    ]

    @UI.Facets :[

        {$Type :'UI.ReferenceFacet',Label:'PO',Target:'@UI.LineItem'},
        {$Type :'UI.ReferenceFacet',Label:'Business Partner',Target:'@UI.Identification'}

    ]
    entity PurchaseOrders as projection on demo.PurchaseOrders;
    entity BusinessPartners as projection on demo.BusinessPartners;

    

}