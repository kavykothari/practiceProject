trigger HireProcess on Hire_Process__c (before insert, after insert,before update) {
    List<Hire_Process__c> hireProcessList = Trigger.new;
    List<Contact> contactList = new List<Contact>();
    List<Case> caseList = new List<Case>();
    List<Case> casestatusList = new List<Case>();
    public string contactId{get;set;}
    public Case casestatus;
    public string hirestatus;
    
    if(Trigger.isBefore && Trigger.isInsert){
        for(Hire_Process__c hp : hireProcessList ){
            Contact contact = new Contact(LastName = hp.Last_Name__c, FirstName = hp.First_Name__c, Email = hp.Email__c, Phone = hp.Phone__c, Experience__c = 0 );
            contactList.add(contact);
            hp.Status__c ='In Progress'; 
        }
        if(contactList.size() > 0 ){
            insert contactList;
        }
        for(Contact con : contactList){
            contactId = con.Id;
            Case casenew = new Case(Status = 'New', ContactId = contactId);
            caseList.add(casenew);
        }
        if(caseList.size() > 0){
            insert caseList;
            for(Hire_Process__c hp : hireProcessList){
                hp.Candidate__c = contactId;
            }
        }
    }
    
        if(Trigger.isUpdate){
            for(Hire_Process__c hp : hireProcessList ){
                contactId = hp.Candidate__c;
                hirestatus = hp.Status__c;
            }
               /* if(hirestatus == 'Completed'){
                    casestatus = new Case();
                    casestatus = [select Status from Case where ContactId =:contactId];
                     casestatus.Status = 'Closed';
                    update casestatus;
            }*/
            
            if(hirestatus == 'Completed'){
                casestatus = [select Status from Case where ContactId =:contactId];
                casestatus.Status = 'Closed';
                casestatusList.add(casestatus);
                update casestatusList;
            }
            
        }
}