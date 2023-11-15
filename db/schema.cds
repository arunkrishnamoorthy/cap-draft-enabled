using { Currency, managed, sap.common.CodeList } from '@sap/cds/common';

namespace captravel;

// Travel Entity - Parent
entity Travel : managed {
    key TravelUUID : UUID;
    TravelID       : Integer @readonly;
    BeginDate      : Date;
    EndDate        : Date;
    TravelPrice    : Decimal(16,2) @Measures.ISOCurrency: TravelCurrency_code;
    TravelCurrency : Currency;
    Description    : String(255);
    to_Booking     : Composition of many Booking on to_Booking.to_Travel = $self;
}

// Booking Entity - Child
entity Booking: managed {
    key BookingUUID : UUID;
    BookingID       : Integer @readonly;
    BookingDate     : Date;
    ConnectionID    : String(4);
    FlightDate      : Date;
    FlightPrice     : Decimal(16,2) @Measures.ISOCurrency: FlightCurrency_code;
    FlightCurrency  : Currency;
    BookingStatus   : Association to BookingStatus;
    to_Travel       : Association to Travel;
}

// Code List
entity BookingStatus : CodeList {
  key Code : String enum {
    New      = 'N';
    Booked   = 'B';
    Canceled = 'C';
  };
};