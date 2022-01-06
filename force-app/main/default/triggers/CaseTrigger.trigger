trigger CaseTrigger on Case (before Update) {
    List<Case> caseList = Trigger.New;
    public string casestatus;
    public string hirestatus;
    public string contactId;
    public Case c;
    public Hire_Process__c hstatus;
    
  /*  hstatus = new Hire_Process__c();
    hstatus = [Select Status__c from Hire_Process__c Where Candidate__c  =: c.ContactId];
    system.debug('hstatus'+hstatus);
*/
    
    List<Hire_Process__c> hireList = new List<Hire_Process__c>();
   // casestatus = Trigger.new.Statust
    for(Case c : caseList){
        casestatus = c.Status;
		contactId =  c.ContactId;
    }
        hireList = [Select Status__c from Hire_Process__c Where Candidate__c  =: contactId];
   // hirestatus = 
    if(casestatus =='Closed'){
        for(Hire_Process__c hire : hireList){
            hirestatus = hire.Status__c;
        }
        if(hirestatus != 'Completed'){
            for(Case c : caseList){
                c.Status.addError('You can not close the case until hire form  is completed');
            }
        }
    }
    
}