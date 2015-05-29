trigger ChatterMessageTrigger on ChatterMessage (before insert, after insert) {
    
    // Handler Class
    ChatterMessageTriggerHandler handler = new ChatterMessageTriggerHandler();

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            // Check NG Keyword
            handler.isNGKeyword(Trigger.new);
        }
    } else if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            // Create Task
            handler.doCreateTask(Trigger.new);
        }
    }
}