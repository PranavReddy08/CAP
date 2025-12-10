sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'ust.employees.modulename',
            componentId: 'EmployeeObjectPage',
            contextPath: '/Department/employees'
        },
        CustomPageDefinitions
    );
});