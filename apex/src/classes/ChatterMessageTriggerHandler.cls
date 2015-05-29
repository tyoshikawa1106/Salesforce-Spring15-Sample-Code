public with sharing class ChatterMessageTriggerHandler {
    
    // Helper Class
    private ChatterMessageTriggerHelper helper = new ChatterMessageTriggerHelper();
    // Dao Class
    private ChatterMessageTriggerDao dao = new ChatterMessageTriggerDao();
    
    /**
     * Constructor
     */
    public ChatterMessageTriggerHandler() {
        
    }
    
    /**
     * Check NG Keyword
     */
    public void isNGKeyword(List<ChatterMessage> chatterMessages) {
        // Check NG Keyword
        this.helper.isNGKeyword(chatterMessages);
    }
    
    /**
     * Create Task
     */
    public void doCreateTask(List<ChatterMessage> chatterMessages) {
        // Get Conversation ID
        Set<Id> conversationIds = this.helper.getConversationIds(chatterMessages);
        // Get ChatterConversationMember
        List<ChatterConversationMember> chatterMembers = this.dao.getChatterConversationMember(conversationIds);
        // Get ChatterConversationMemberMap
        Map<Id, List<ChatterConversationMember>> chatterMemberMap = this.helper.getChatterConversationMemberMap(chatterMembers);
        // Get Create Tasks
        List<Task> tasks = this.helper.getCreateTasks(chatterMessages, chatterMemberMap);
        // INSERT (DmlException対応は省略)
        List<Database.Saveresult> results = database.insert(tasks, true);
    }
}