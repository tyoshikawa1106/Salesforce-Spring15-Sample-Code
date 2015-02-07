@isTest
private class AddressAndLocationDemoControllerTest {
    
    private static User testAdminUser = CommonTester.getLoginUser();

    /**
     * AddressAndLocationDemoControllerTest1
     */
    static testMethod void AddressAndLocationDemoControllerTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Test
            AddressAndLocationDemoController cls = new AddressAndLocationDemoController();
            
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.wrapperList.isEmpty(), true);
        }
    }
    
    /**
     * AddressAndLocationDemoControllerTest2
     */
    static testMethod void AddressAndLocationDemoControllerTest2() {
        
        System.runAs(testAdminUser) {
            
            // Create Account
            Account account = new Account(
                 Name = 'Test Account'
                ,BillingCountry = '日本'
                ,BillingPostalCode = '1xx-xxxxx'
                ,BillingState = '東京都'
                ,BillingCity = '千代田区'
                ,BillingStreet = '1-1-1'
                ,MyLocation__Latitude__s = 35.681
                ,MyLocation__Longitude__s = 139.764
            );
            insert account;

            Test.startTest();
            
            // Test
            AddressAndLocationDemoController cls = new AddressAndLocationDemoController();
            
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.wrapperList.size(), 1);
            System.assertEquals(cls.wrapperList[0].account.Name, account.Name);
            System.assertEquals(cls.wrapperList[0].acctCountry, account.BillingCountry);
            System.assertEquals(cls.wrapperList[0].acctZipCode, account.BillingPostalCode);
            System.assertEquals(cls.wrapperList[0].acctState, account.BillingState);
            System.assertEquals(cls.wrapperList[0].acctCity, account.BillingCity);
            System.assertEquals(cls.wrapperList[0].acctStreet, account.BillingStreet);
            System.assertEquals(cls.wrapperList[0].lat, account.MyLocation__Latitude__s);
            System.assertEquals(cls.wrapperList[0].lon, account.MyLocation__Longitude__s);
        }
    }
}