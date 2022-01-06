trigger ProjectTrigger on Project__c (after insert, before update) {
    ProjectTriggerHelper.newFiveProjectTask(Trigger.new);    
}