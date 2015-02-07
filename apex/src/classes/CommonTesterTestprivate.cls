@isTest
private class CommonTesterTestprivate {

	private static User testAdminUser = CommonTester.getLoginUser();
    
    /**
     * テスト実行ユーザ取得 テスト
     */
    static testMethod void getLoginUserTest() {
        
        Test.startTest();
        
        User result = CommonTester.getLoginUser();
        System.assertEquals(result.Id, UserInfo.getUserId());
        
        Test.stopTest();
    }
}