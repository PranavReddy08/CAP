using employee as service from '../../srv/service';
annotate service.Department with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
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
        {
            $Type:'UI.ReferenceFacet',
            Label:'Employees',
            Target:'employees/@UI.LineItem'
            // Facets:[
            //     {$Type:'UI.ReferenceFacet',
            //     Label:'Attendance',
            //     Target:'employees.attendances/@UI.LineItem'}
            // ]
        }
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'description',
            Value : description,
        },
    ],
);

annotate service.Employee with @(
    UI.LineItem: [
        { Value: ID, Label: 'Employee ID' },
        { Value: firstName, Label: 'First Name' },
        { Value: lastName, Label: 'Last Name' },
        { Value: email, Label: 'Email' },
        { Value: department.name, Label: 'Department' },
        {Value:status,Label:'Status',Criticality:statusCode}
    ],
    UI.Facets:[
        {$Type:'UI.ReferenceFacet',
        Label:'Employee Details',
        Target:'@UI.Identification'},

         {
            $Type: 'UI.CollectionFacet',
            ID: 'EmployeeActivity',
            Label: 'Employee Activity',
            Facets: [
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Attendance',
                    Target: 'attendances/@UI.LineItem'
                },
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Leaves',
                    Target: 'leaves/@UI.LineItem'
                }
            ]
        }
    ],
    UI.Identification:[
        {Value:firstName,Label:'Name'},
        {Value:department.name,Label:'Department'},
        {Value:role.level,Label:'Level'}
    ]
    
    
);

annotate service.Attendance with @(
    UI.LineItem:[
        {Value:checkIn,Label:'Check IN' },
        {Value:checkOut,Label:'Check Out'},
        {Value:date,Label:'Date'}
    ]
 );
 annotate service.Leaves with @(
    UI.LineItem:[
        {Value:leaveType,Label:'Leave Type'},
        {Value:startDate,Label:'Start'},
        {Value:endDate,Label:'End'},
        {Value:status,Label:'Status'}
    ]
 );
 


