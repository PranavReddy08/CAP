sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"modulename/test/integration/pages/studentList",
	"modulename/test/integration/pages/studentObjectPage"
], function (JourneyRunner, studentList, studentObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('modulename') + '/test/flp.html#app-preview',
        pages: {
			onThestudentList: studentList,
			onThestudentObjectPage: studentObjectPage
        },
        async: true
    });

    return runner;
});

