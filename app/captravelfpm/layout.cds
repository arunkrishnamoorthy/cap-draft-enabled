using TravelService as service from '../../srv/service';

annotate service.Travel with @( 
    UI.SelectionFields: [
        BeginDate,
        EndDate
    ],
    UI.LineItem: [
        {   
            $Type: 'UI.DataField',
            Value: TravelID
        },
        {
            $Type: 'UI.DataField',
            Value: BeginDate
        },
        {
            $Type: 'UI.DataField',
            Value: EndDate
        },
        {
            $Type: 'UI.DataField',
            Value: TravelPrice
        }
    ],
    UI.FieldGroup#general: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type : 'UI.DataField',
                Label : 'Start Date',
                Value : BeginDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'End Date',
                Value : EndDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Travel Price',
                Value : TravelPrice,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : Description,
            },
        ]
    }
);
