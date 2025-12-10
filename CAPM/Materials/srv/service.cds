using demo from '../db/schema';

service MyService {
    @UI.HeaderInfo :{
        TypeName : 'Material',
        TypeNamePlural:'Materials',
        Title : MaterialID,
        Description :MaterialDesc
    }
    
    @UI.SelectionFields:[MaterialID]
    @UI.LineItem:[
        {Value:MaterialID,Label:'{i18n>MaterialID}'},
        {Value:MaterialDesc,Label:'{i18n>Description}'}

    ]

    @UI.Identification:[
        {Value:details.MaterialID,Label:'{i18n>ID}'},
        {Value:details.MovementID,Label:'{i18n>MovementID}'},
        {Value:details.MovementType,Label:'{i18n>Type}'}
    ]

    @UI.Facets:[
        {$Type:'UI.ReferenceFacet',Label:'{i18n>GoodsMovements}',Target:'@UI.Identification'}
    ]

    
    entity Materials as projection on demo.Materials;
    entity GoodsMovements as projection on demo.GoodsMovements;

    

}