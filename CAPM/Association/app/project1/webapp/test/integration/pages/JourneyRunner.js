sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/emp/project1/test/integration/pages/Tab1List",
	"com/emp/project1/test/integration/pages/Tab1ObjectPage",
	"com/emp/project1/test/integration/pages/Tab2ObjectPage"
], function (JourneyRunner, Tab1List, Tab1ObjectPage, Tab2ObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/emp/project1') + '/test/flp.html#app-preview',
        pages: {
			onTheTab1List: Tab1List,
			onTheTab1ObjectPage: Tab1ObjectPage,
			onTheTab2ObjectPage: Tab2ObjectPage
        },
        async: true
    });

    return runner;
});

