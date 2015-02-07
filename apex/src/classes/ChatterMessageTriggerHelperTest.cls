@isTest
private class ChatterMessageTriggerHelperTest {

    private static ChatterMessageTriggerHelper helper = new ChatterMessageTriggerHelper();
    private static User testAdminUser = CommonTester.getLoginUser();
    
    /**
     * Check NG Keyword
     */
    static testMethod void isNGKeywordTest1() {
        
        System.runAs(testAdminUser) {

            List<ChatterMessage> chatterMessages = new List<ChatterMessage>();

            Test.startTest();

            // Test
            Boolean result = helper.isNGKeyword(chatterMessages);
            
            Test.stopTest();

            // Result
            System.assertEquals(result, false);
        }
    }

    /**
     * Check NG Keyword
     */
    static testMethod void isNGKeywordTest2() {
        
        System.runAs(testAdminUser) {

            ChatterMessage chatterMessage = new ChatterMessage(
                Body = 'NG!!'
            );

            List<ChatterMessage> chatterMessages = new List<ChatterMessage>();
            chatterMessages.add(chatterMessage);

            Test.startTest();

            // Test
            Boolean result = helper.isNGKeyword(chatterMessages);
            
            Test.stopTest();

            // Result
            System.assertEquals(result, true);
        }
    }

    /**
     * Get Conversation ID
     */
    static testMethod void getConversationIdsTest1() {
        
        System.runAs(testAdminUser) {

            List<ChatterMessage> chatterMessages = new List<ChatterMessage>();

            Test.startTest();

            // Test
            Set<Id> results = helper.getConversationIds(chatterMessages);
            
            Test.stopTest();

            // Result
            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * Get ChatterConversationMember Map
     */
    static testMethod void getChatterConversationMemberMapTest1() {
        
        System.runAs(testAdminUser) {

            List<ChatterConversationMember> chatterConversationMembers = new List<ChatterConversationMember>();

            Test.startTest();

            // Test
            Map<Id, List<ChatterConversationMember>> resultMap = helper.getChatterConversationMemberMap(chatterConversationMembers);
            
            Test.stopTest();

            // Result
            System.assertEquals(resultMap.isEmpty(), true);
        }
    }

    /**
     * Get ChatterConversationMember Map
     */
    static testMethod void getCreateTasksTest1() {
        
        System.runAs(testAdminUser) {

            List<ChatterMessage> chatterMessages = new List<ChatterMessage>();
            Map<Id, List<ChatterConversationMember>> chatterMemberMap = new Map<Id, List<ChatterConversationMember>>();

            Test.startTest();

            // Test
            List<Task> results = helper.getCreateTasks(chatterMessages, chatterMemberMap);
            
            Test.stopTest();

            // Result
            System.assertEquals(results.isEmpty(), true);
        }
    }
}