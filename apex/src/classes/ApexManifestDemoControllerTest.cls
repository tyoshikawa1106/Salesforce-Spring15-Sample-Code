@isTest
private class ApexManifestDemoControllerTest {

    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * ApexManifestDemoControllerTest
     */
    static testMethod void ApexManifestDemoControllerTest() {
        
        System.runAs(testAdminUser) {

            // Set HttpCalloutMock
            Test.setMock(HttpCalloutMock.class, new ApexMainfestDemoHttpMock());

            Test.startTest();
            
            // Test
            ApexManifestDemoController cls = new ApexManifestDemoController();
            
            Test.stopTest();
            
            // Result
            //System.assertEquals(cls.wrapperList.size(), 1);
        }
    }
}