public class ProjectTaskTriggerHelper {
    public static  Map<Id,Project_Task__c> projectTaskMap = new Map<Id,Project_Task__c>();
    public static  Map<Id,Project_Task__c> previousTaskMap = new Map<Id,Project_Task__c>();
    public static Map<Id,Project__c> projectMap =  new Map<Id ,Project__c>();
    public static Set<Id> projectIdSets = new Set<Id>();
    
    public static Map<Id, Project_Task__c> createProjectMap(List<Project_Task__c> taskList) {
        system.debug('@2 ');
        Map<Id, Project_Task__c> previousProjectTaskMap = new Map<Id, Project_Task__c>();
        for(Project_Task__c projectTask : taskList) {
            if(projectTask.Previous_Task__c != NULL) {
                previousProjectTaskMap.put(projectTask.Previous_Task__c, projectTask);
            }
        }
        return previousProjectTaskMap;
    }
    
    public static List<Project_Task__c> previousProjectTaskList(Set<Id> projectTask) {
        return [SELECT Id, Name, Type__c, Completed__c FROM Project_Task__c WHERE Id IN : projectTask];
    }
    
    //use to update parent status value
    public static void isComplete(List<Project_Task__c> projectTaskList){
        if(trigger.isUpdate){
            for(Project_Task__c projectTask : projectTaskList) {
                projectIdSets.add(projectTask.Project__c); //parent Id
            }
            if(!projectIdSets.isEmpty()) {
                projectMap =  new Map<Id,Project__c>([Select Id,Name,Status__c From Project__c where Id in: projectIdSets]);  // parent full details
            }
        }
    }
    
    // validation rule
    public static void previousTaskCompleted(List<Project_Task__c> currentTaskList, List<Project_Task__c> previousTaskList) {
        system.debug('@@ ===== yes in validation ');
        for(Project_task__c currentTask : currentTaskList) {
            if(currentTask.Previous_Task__c != Null){
                for(Project_task__c previousTask : previousTaskList) {
                    if( currentTask.Completed__c == true && previousTask.Completed__c == false ) {
                        currentTask.Completed__c.addError('Task cant be marked as completed untill the previous task is completed ');
                    }
                    
                    if(currentTask.Completed__c == true && currentTask.Completion_Date__c == null) {
                        currentTask.Completion_Date__c.addError('Completion Date should not be empty');
                    }
                    
                    if(currentTask.Completed__c == false && currentTask.Completion_Date__c != null) {
                        currentTask.Completed__c.addError('you havent ticked completed');
                    }
                    
                    if( currentTask.Completed__c == true && previousTask.Completed__c == true && currentTask.Completion_Date__c != null)
                    {
                        completedTaskMapping(currentTaskList); //parent status change
                    }
                }
            } else {
                if(currentTask.Completed__c == true && currentTask.Completion_Date__c == null || currentTask.Completed__c == false && currentTask.Completion_Date__c != null) {
                    currentTask.addError('Please check Completion Date or Tick Completed');
                }
                if(currentTask.Completed__c == true && currentTask.Previous_Task__c == null && currentTask.Completion_Date__c != null) {
                    completedTaskMapping(currentTaskList); //parent status change
                }
            }
        }
    }
    
    //parent status change method
    public static void completedTaskMapping(List<Project_Task__c> projectTaskList){
        for(Project_Task__c project : projectTaskList) {
            if(project.Project__c != Null && project.Completed__c == true) {
                if(project.Type__c == 'New Task') {
                    projectMap.get(project.Project__c).Status__c = 'New'; 
                }else if(project.Type__c == 'Planning Phase') {
                    projectMap.get(project.Project__c).Status__c = 'Planning';   
                }else if(project.Type__c == 'Construction Work') {
                    projectMap.get(project.Project__c).Status__c = 'Construction';  
                }else if(project.Type__c == 'Completion Step') {
                    projectMap.get(project.Project__c).Status__c = 'Deployment';  
                }else if(project.Type__c == 'Contract End') {
                    projectMap.get(project.Project__c).Status__c  ='Signoff';
                }
                system.debug('@projectMap@ == '+projectMap);
            }
        }
        update  projectMap.values();
    }
    
}