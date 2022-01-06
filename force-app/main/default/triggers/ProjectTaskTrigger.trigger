trigger ProjectTaskTrigger on Project_Task__c (before update, after update) {
    List <Project_Task__c> projectTask = Trigger.New;
    List<Project_Task__c>previousProjectTaskList = new List<Project_Task__c>();
    Map<Id, Project_Task__c> previousProjectTaskMap = ProjectTaskTriggerHelper.createProjectMap(projectTask); //previous task id, current task detail
  
    if(previousProjectTaskMap.keySet().size() > 0){
        system.debug('@1 ');
        previousProjectTaskList = ProjectTaskTriggerHelper.previousProjectTaskList(previousProjectTaskMap.keySet()); //previous task full details
    }
    
    // use to update parent status value
    if(Trigger.isBefore && Trigger.isUpdate){
        ProjectTaskTriggerHelper.isComplete(projectTask);        
    }
    
    //validation rule
    if(trigger.isAfter && Trigger.isUpdate){
         system.debug('@@ ===== yes in validation rule part ');
                 system.debug('previousProjectTaskList size ='+previousProjectTaskList.size());
            ProjectTaskTriggerHelper.previousTaskCompleted(projectTask, previousProjectTaskList);
    }
}