sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.emp.project1',
            componentId: 'Tab1List',
            contextPath: '/Tab1'
        },
        CustomPageDefinitions
    );
});