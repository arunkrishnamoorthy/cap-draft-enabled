sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/travelapp/fpm/captravelfpm/test/integration/FirstJourney',
		'com/travelapp/fpm/captravelfpm/test/integration/pages/TravelMain'
    ],
    function(JourneyRunner, opaJourney, TravelMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/travelapp/fpm/captravelfpm') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTravelMain: TravelMain
                }
            },
            opaJourney.run
        );
    }
);