@isTest
private class ChatterMessageTriggerDaoTest {

    private static ChatterMessageTriggerDao dao = new ChatterMessageTriggerDao();
    private static User testAdminUser = CommonTester.getLoginUser();
    
    /**
     * getChatterConversationMember
     */
    static testMethod void getChatterConversationMemberTest1() {
        
        System.runAs(testAdminUser) {

            Set<Id> conversationIds = new Set<Id>();

            Test.startTest();

            // Test
            List<ChatterConversationMember> results = dao.getChatterConversationMember(conversationIds);

            Test.stopTest();

            // Result
            System.assertEquals(results.isEmpty(), true);
        }
    }
}