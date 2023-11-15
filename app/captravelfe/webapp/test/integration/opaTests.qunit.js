sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/captravel/fe/captravelfe/test/integration/FirstJourney',
		'com/captravel/fe/captravelfe/test/integration/pages/TravelList',
		'com/captravel/fe/captravelfe/test/integration/pages/TravelObjectPage',
		'com/captravel/fe/captravelfe/test/integration/pages/BookingObjectPage'
    ],
    function(JourneyRunner, opaJourney, TravelList, TravelObjectPage, BookingObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/captravel/fe/captravelfe') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTravelList: TravelList,
					onTheTravelObjectPage: TravelObjectPage,
					onTheBookingObjectPage: BookingObjectPage
                }
            },
            opaJourney.run
        );
    }
);