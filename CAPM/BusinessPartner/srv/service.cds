using bpso from '../db/schema';

service MyService {
    //   @UI.LineItem: [
    //     { Value: BPID, Label: '{i18n>BP_ID}' },
    //     { Value: BPName, Label: '{i18n>BP_Name}' },
    //     { Value: BPType, Label: 'BP_Type' },
    //     { Value: Country, Label: 'Country' },
    //     { Value: City, Label: 'City' }
    // ]

     entity SalesOrder as projection on bpso.SalesOrder ;

     @UI.HeaderInfo: {
        TypeName: '{i18n>Business_Partner}',
        TypeNamePlural: '{i18n>Business_Partners}',
        Title: { Value: BPName }
    }

    @UI.LineItem: [
        { Value: BPID, Label: '{i18n>BP_ID}' },
        { Value: BPName, Label: '{i18n>BP_Name}' },
        { Value: BPType, Label: 'BP_Type' },
        { Value: Country, Label: 'Country' },
        { Value: City, Label: 'City' }
    ]

    
@UI.Identification: [
        { Value: display.SOID, Label: 'Sales Order ID' },
        { Value: display.SODate, Label: 'Sales order Date' },
        { Value: display.Status, Label: 'Status' },
        { Value: display.Currency, Label: 'Currency' },
        { Value: display.NetAmount, Label: 'Net amount' }
    ]

    @UI.Facets: [
         { $Type: 'UI.ReferenceFacet', Label: 'General', Target: '@UI.LineItem' },
     { $Type: 'UI.ReferenceFacet', Label: 'General', Target: '@UI.Identification' }
   
  ]
   @UI.SelectionFields: [ BPID ]
     entity BusinessPartner as projection on bpso.BusinessPartner;
     

}
