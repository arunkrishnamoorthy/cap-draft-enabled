using { captravel as my } from '../db/schema';

service TravelService {
    @odata.draft.enabled
    entity Travel as projection on my.Travel;
    entity Booking as projection on my.Booking;
}
