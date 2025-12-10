sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.emp.project1',
            componentId: 'Tab2ObjectPage',
            contextPath: '/Tab1/details'
        },
        CustomPageDefinitions
    );
});