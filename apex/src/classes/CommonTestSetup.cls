@isTest
private class CommonTestSetup {
    
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    private static Id wkAccountId = null;
    
    @testSetup
    static void setup() {
        
        System.runAs(testAdminUser) {

            // Create common test accounts
            Account testAccount = new Account(Name = 'Sample Account');
            insert testAccount;
            System.assertEquals(String.isNotEmpty(testAccount.Id), true);
            // クラス変数に値をセット(検証用)
            wkAccountId = testAccount.Id;
            System.assertEquals(String.isNotEmpty(wkAccountId), true);
        }
    }
    
    /**
     * testMethod1
     */
    static testMethod void testMethod1() {
        
        System.runAs(testAdminUser) {
            
            // @testSetupで作成したレコードをSOQLで取得できる
            Integer accountCount = [SELECT COUNT() FROM Account LIMIT 200];
            System.assertEquals(accountCount, 1);
            
            // ※@testSetup内の変数は直接使用できない。
            //System.assertEquals(String.isNotEmpty(testAccount.Id), true);
            // クラス変数にセットしても@testSetup内の値は引き継げない
            System.assertEquals(String.isEmpty(wkAccountId), true);

            Test.startTest();
            
            // your test code
            
            Test.stopTest();
        }
    }
}
