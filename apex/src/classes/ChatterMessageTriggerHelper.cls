public class ChatterMessageTriggerHelper {
    
    /**
     * Constructor
     */
    public ChatterMessageTriggerHelper() {
        
    }
    
    /**
     * Check NG Keyword
     */
    public Boolean isNGKeyword(List<ChatterMessage> chatterMessages) {
        Boolean isError = false;
        for (ChatterMessage c : chatterMessages) {
            String message = c.Body;
            if (message.indexOf('NG!!') >= 0) {
                c.addError('Sorry... Your Message NG Keyword : 『NG!!』');
                // IsError
                isError = true;
            }
        }
        return isError;
    }
    
    /**
     * Get Conversation ID
     */
    public Set<Id> getConversationIds(List<ChatterMessage> chatterMessages) {
        Set<Id> conversationIds = new Set<Id>();
        for (ChatterMessage c : chatterMessages) {
            if (String.isNotEmpty(c.ConversationId)) {
                conversationIds.add(c.ConversationId);
            }
        }
        
        return conversationIds;
    }

    /**
     * Get ChatterConversationMember Map
     * Key = ConversationId
     */
    public Map<Id, List<ChatterConversationMember>> getChatterConversationMemberMap(List<ChatterConversationMember> chatterConversationMembers) {
        Map<Id, List<ChatterConversationMember>> chatterMemberMap = new Map<Id, List<ChatterConversationMember>>();
        
        for (ChatterConversationMember cMember : chatterConversationMembers) {
            List<ChatterConversationMember> chatterMembers = new List<ChatterConversationMember>();
            if (chatterMemberMap.containsKey(cMember.ConversationId)) {
                chatterMembers = chatterMemberMap.get(cMember.ConversationId);
            }
            // Add List
            chatterMembers.add(cMember);
            // Add Map
            chatterMemberMap.put(cMember.ConversationId, chatterMembers);
        }

        return chatterMemberMap;
    }

    /**
     * Get Create Tasks
     */
    public List<Task> getCreateTasks(List<ChatterMessage> chatterMessages, Map<Id, List<ChatterConversationMember>> chatterMemberMap) {
        List<Task> tasks = new List<Task>();
        
        for (ChatterMessage c : chatterMessages) {
            if (chatterMemberMap.containsKey(c.ConversationId)) {
                List<ChatterConversationMember> chatterMambers = chatterMemberMap.get(c.ConversationId);
                for (ChatterConversationMember cMember : chatterMambers) {
                
                    Task task = new Task(
                         OwnerId = cMember.MemberId
                        ,Subject = 'Send Chatter Message'
                        ,Description = URL.getSalesforceBaseUrl().toExternalForm() + '/_ui/core/chatter/ui/ChatterPage'
                    );
                    // Add List
                    tasks.add(task);
                }
            }
        }

        return tasks;
    }
}