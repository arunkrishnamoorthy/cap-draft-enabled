
using TravelService from './service';

annotate TravelService.Travel with{
    TravelID        @title : 'Travel ID';
    BeginDate       @title : 'Begin Date';
    EndDate         @title : 'End Date';
    TravelPrice     @title : 'Price';
    TravelCurrency  @title : 'Currency';
    Description     @title : 'Description';
    to_Booking      @title : 'Bookings';
}

annotate TravelService.Booking with{
    BookingID       @title : 'Booking ID';
    BookingDate     @title : 'Booking Date';
    ConnectionID    @title : 'Connection ID';
    FlightDate      @title : 'Flight Date';
    FlightPrice     @title : 'Flight Price';
    FlightCurrency  @title : 'Currency';
}

annotate TravelService.Travel with @(
    UI: {
        HeaderInfo: {
			TypeName: 'Travel',
			TypeNamePlural: 'Travels',
			Title          : {
                $Type : 'UI.DataField',
                Value : TravelID
            },
			Description : {
				$Type: 'UI.DataField',
				Value: Description
			}
		},
        SelectionFields: [TravelID],
        LineItem:[
            {Value: TravelID},
            {Value: BeginDate},
            {Value: EndDate},
            {Value: TravelPrice},
            {Value: Description}
        ],
        Facets: [
            {$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'},
            {$Type: 'UI.ReferenceFacet', Label: 'Flights', Target: 'to_Booking/@UI.LineItem' }
        ],
        FieldGroup#Main: {
            Data: [
                {Value: TravelID},
                {Value: BeginDate},
                {Value: EndDate},
                {Value: TravelPrice},
                {Value: Description}
            ]
        }
    }
){};

annotate TravelService.Booking with @(
    UI: {
        LineItem: [
            {Value: BookingID},
            {Value: BookingDate},
            {Value: ConnectionID},
            {Value: FlightDate},
            {Value: FlightPrice}
            // {Value: BookingStatusCode, Label: 'Booking Status'}
        ]
    }
){};