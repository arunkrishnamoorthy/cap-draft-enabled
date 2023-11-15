const cds = require('@sap/cds');

class TravelService extends cds.ApplicationService{
    async init(){
        const { Travel, Booking } = this.entities;

        this.before('NEW', Travel, async req => {
            const { maxID } = await SELECT.one `max(TravelID) as maxID` .from (Travel)
            req.data.TravelID = maxID + 1
        } )

        this.before('NEW', Booking, async req => {
            const { to_Travel_TravelUUID } = req.data
            const { maxID } = await SELECT.one `max(BookingID) as maxID` .from (Booking.drafts) .where ({to_Travel_TravelUUID})
            req.data.BookingID = maxID + 1
            req.data.BookingStatus_code = 'N'
            req.data.BookingDate = (new Date).toISOString().slice(0,10)
        } )

        await super.init()
    }
}

module.exports = TravelService