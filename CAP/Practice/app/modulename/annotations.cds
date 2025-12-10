using studentService as service from '../../srv/service';
annotate service.student with @(
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
                Label : 'firstName',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastName',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'dob',
                Value : dob,
            },
            {
                $Type : 'UI.DataField',
                Label : 'class_id',
                Value : class_id,
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
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'id',
            Value : id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'firstName',
            Value : firstName,
            // Criticality:colourCode
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastName',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'dob',
            Value : dob,
        },
        {
            $Type : 'UI.DataField',
            Label : 'class_id',
            Value : class_id,
    },
    {
        $Type:'UI.DataFieldForAction',
        Label:'Action',
        Action:'Boost',
        Inline:true
    }

    ],
    UI.SelectionFields:[
        id,
        firstName

    ]
);

annotate service.student with {
    class @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'semester',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : class_id,
                ValueListProperty : 'id',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'specialization',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'HOD',
            },
        ],
    }
};

