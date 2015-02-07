public class ChatterMessageTriggerDao {
    
    /**
     * Constructor
     */
    public ChatterMessageTriggerDao() {
        
    }
    
    /**
     * getChatterConversationMember
     */
    public List<ChatterConversationMember> getChatterConversationMember(Set<Id> conversationIds) {
        return [
            SELECT
                 Id
                ,MemberId
                ,ConversationId
            FROM
                ChatterConversationMember
            WHERE
                ConversationId IN: conversationIds
        ];
    }
}