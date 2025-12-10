sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ust/employees/modulename/test/integration/pages/DepartmentList",
	"ust/employees/modulename/test/integration/pages/DepartmentObjectPage",
	"ust/employees/modulename/test/integration/pages/EmployeeObjectPage"
], function (JourneyRunner, DepartmentList, DepartmentObjectPage, EmployeeObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ust/employees/modulename') + '/test/flp.html#app-preview',
        pages: {
			onTheDepartmentList: DepartmentList,
			onTheDepartmentObjectPage: DepartmentObjectPage,
			onTheEmployeeObjectPage: EmployeeObjectPage
        },
        async: true
    });

    return runner;
});

