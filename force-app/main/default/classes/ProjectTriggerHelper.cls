public class ProjectTriggerHelper {
    public static void newFiveProjectTask(List<Project__c> projectList){
        List<Project_Task__c> projectTaskList = new List<Project_Task__c>(); 
        String[] projectTaskType = new String[] {'New Task', 'Planning Phase', 'Construction Work','Completion Step','Contract End'};
            if(trigger.isInsert){
                for(Project__c project : projectList){
                    if(project.Status__c == Null) {
                        for (Integer i = 0; i < 5; i++)  {
                            Project_Task__c projecttask  = new Project_Task__c ();
                            projecttask.Project__c = project.Id;
                            projecttask.Type__c = projectTaskType[i];
                            projectTaskList.add(projecttask);
                        }
                    }else {
                        project.Status__c.addError('You can not change status Manually');
                    }
                    
                }
                insert projectTaskList;
            }
        
        for(integer i = 0; i < projectTaskList.size() - 1; i++) {
            projectTaskList[i+1].Previous_Task__c = projectTaskList[i].Id;
        }
        update projectTaskList;
    }
}