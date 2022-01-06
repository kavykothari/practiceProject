public class StudentController {
    public List<Student__c> studentList{get;set;}
    public Student__C student{get;set;}
   
    public StudentController(){
        studentList = new List<Student__c>();
        studentList = [select Student__c, Name, Email__c, Phone__c, Gender__c, Date_of_Birth__c, Address__c from student__c ];
        student = new Student__c();
        
    }
    public PageReference saveButton(){
        
        try{
            insert student;
                    PageReference pageRef = ApexPages.currentPage();
              pageRef.setRedirect(true);
              return pageRef;
        }catch(Exception ex){
            ApexPages.addMessages(ex);
            return null;
        }
    }

}