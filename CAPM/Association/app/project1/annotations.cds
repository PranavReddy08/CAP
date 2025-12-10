using MyService as service from '../../srv/relation';
annotate service.Tab1 with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'id',
                Value : id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {$Type : 'UI.ReferenceFacet',
            ID : 'details',
            Label : 'General details',
            Target : 'details/@UI.LineItem',//adding target details

        }
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'id',
            Value : id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
    ],
);


//table 2

annotate service.Tab2 with @(
    
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet2',
            Label : 'General Information',
            Target : '@UI.LineItem',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'empid',
            Value : empid,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Deptid',
            Value : deptid,
        },
         {
            $Type : 'UI.DataField',
            Label : 'Dept',
            Value : dept,
        },
    ],
);
