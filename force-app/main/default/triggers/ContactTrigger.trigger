trigger ContactTrigger on Contact (before insert,before update) {
    List <Contact> contactList = Trigger.new;
    for(Contact contact : contactList){
        if(contact.Designation__c=='Clerk'){
            if(contact.Salary__c < 5000 || contact.Salary__c > 15000 || contact.Salary__c==NULL){
                contact.Salary__c.addError('Salary Must Be In Between 5000 To 15000');
            }
        }else if(contact.Designation__c=='Manager'){
            if(contact.Salary__c<12000 || contact.Salary__c>50000 || contact.Salary__c==NULL){
                contact.Salary__c.addError('Salary Must Be In Between 12000 To 50000');
            }
        }else if(contact.Designation__c=='Accountant' || contact.Salary__c==NULL){
            if(contact.Salary__c<10000 || contact.Salary__c>30000){
                contact.Salary__c.addError('Salary Must Be In Between 10000 To 30000');
                
            }
        }
    }

}