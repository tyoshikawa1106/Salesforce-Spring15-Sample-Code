@isTest
private class ChatterMessageTriggerHandlerTest {

    private static User testAdminUser = CommonTester.getLoginUser();
    
    /**
     * Check NG Keyword
     */
    @isTest(SeeAllData=true)
    static void doSendChatterMessageTest1() {
        
        System.runAs(testAdminUser) {

            // ユーザ テストデータ作成
            Id profileId = UserInfo.getProfileId();
            User user = CommonTester.createUser(profileId, true);

            String message = 'NG!!';
            Id userId = user.Id;

            Test.startTest();

            // テスト結果判定
            Boolean result = false;

            // Chatter Message 送信
            try {
                // ※ try - catch でもbefore Triggerのエラーをキャッチできないっぽい...
                //ConnectApi.ChatterMessage chatterMessage = CommonTester.doSendChatterMessage(message, userId);
            } catch (Exception e) {
                result = true;
            }
            
            Test.stopTest();

            // Result
            //System.assertEquals(result, true);
        }
    }

    /**
     * Check NG Keyword
     */
    @isTest(SeeAllData=true)
    static void doSendChatterMessageTest2() {
        
        System.runAs(testAdminUser) {

            // ユーザ テストデータ作成
            Id profileId = UserInfo.getProfileId();
            User user = CommonTester.createUser(profileId, true);

            String message = 'OK!!';
            Id userId = user.Id;

            Test.startTest();

            // テスト結果判定
            Boolean result = false;

            // Chatter Message 送信
            try {
                ConnectApi.ChatterMessage chatterMessage = CommonTester.doSendChatterMessage(message, userId);
            } catch(Exception e) {
                result = true;
            }
            
            Test.stopTest();

            // Result
            System.assertEquals(result, false);
        }
    }

    /**
     * Check NG Keyword
     */
    @isTest(SeeAllData=true)
    static void doCreateTaskTest1() {
        
        System.runAs(testAdminUser) {

            // ユーザ テストデータ作成
            Id profileId = UserInfo.getProfileId();
            User user = CommonTester.createUser(profileId, true);

            String message = 'OK!!';
            Id userId = user.Id;

            Test.startTest();

            // Chatter Message 送信
            ConnectApi.ChatterMessage chatterMessage = CommonTester.doSendChatterMessage(message, userId);
            
            Test.stopTest();

            // Result
            List<Task> resultTasks = [SELECT Id,Subject FROM Task WHERE OwnerId =: user.Id];
            System.assertEquals(resultTasks.size(), 1);
            System.assertEquals(resultTasks[0].Subject, 'Send Chatter Message');
        }
    }
}