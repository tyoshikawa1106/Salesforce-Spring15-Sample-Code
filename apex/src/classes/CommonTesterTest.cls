@isTest
private class CommonTesterTest {

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

    /**
     * ユーザ テストデータ作成
     */
    static testMethod void createUserTest() {

        System.runAs(testAdminUser) {
            Id profileId = UserInfo.getProfileId();
            
            Test.startTest();
            
            // Insertなし
            User user = CommonTester.createUser(profileId, false);
            System.assertEquals(String.isEmpty(user.Id), true);
            
            // Insertあり
            user = CommonTester.createUser(profileId, true);
            System.assertEquals(String.isNotEmpty(user.Id), true);
            
            Test.stopTest();
        }
    }

    /**
     * ChatterMessage 投稿
     */
    @IsTest(SeeAllData=true)
    static void doSendChatterMessageTest() {
        
        System.runAs(testAdminUser) {

            // ユーザ テストデータ作成
            Id profileId = UserInfo.getProfileId();
            User user = CommonTester.createUser(profileId, true);

            String message = 'Message!!';
            Id userId = user.Id;

            Test.startTest();
            
            ConnectApi.ChatterMessage chatterMessage = CommonTester.doSendChatterMessage(message, userId);
            
            Test.stopTest();
        }
    }
}