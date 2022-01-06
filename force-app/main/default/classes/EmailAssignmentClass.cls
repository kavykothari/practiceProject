public class EmailAssignmentClass {
    public List<Contact> selectedContactList{get;set;}
    public List<EmailAssignmentWrapperClass> selectedContactList2{get;set;}
    public List<Contact> conList{get;set;}    
    public String selectedName{get;set;}
    public List<string> emailListToSend{get;set;}
    public Contact selectedContactName {get;set;}
    public Attachment att{get;set;}
    public Boolean attachmentChecked{get;set;}
    
    
    public EmailAssignmentClass(){
        filterContactList = new List<EmailAssignmentWrapperClass>();
        selectedContactList2 = new List<EmailAssignmentWrapperClass>();
        emailListToSend = new List<string> ();        
    }
    
    public void addButton(){
        Attachment[] attachment = [Select Id, Name, Body From Attachment where ParentId =: selectedName];
        
        EmailAssignmentWrapperClass emailAssignmentWrapperClass = new EmailAssignmentWrapperClass();
        if(selectedName!='--none-'){
            emailAssignmentWrapperClass.contact = [Select Id, Name, Email from Contact where Id =: selectedName ];
            if(attachment.size()>0){
                emailAssignmentWrapperClass.attachment = [Select Id, Name, Body From Attachment where ParentId =: selectedName];
            }
            filterContactList.add(emailAssignmentWrapperClass);
            System.debug('kk'+filterContactList);
        }
        
    }
    
    
    public List<SelectOption> getcontactNameOptionList(){
        List<SelectOption> contactNameOptionList = new List<SelectOption>();
        contactNameOptionList.add(new SelectOption('--none-','--None--'));
        
        for(Contact contactNames : [select Id, Name, Email, Phone from Contact]) {
            //system.debug('see  ='+contactNames.Id);
            contactNameOptionList.add(new SelectOption(contactNames.Id,contactNames.Name));
        }
        //system.debug('contact name list' + contactNameOptionList);
        return contactNameOptionList;
    }
    
    public void getName(){
        system.debug('selectedName'+selectedName);
        
    }
    public PageReference sendButton(){ 
        
        selectedContactList2.clear();
        system.debug('filterContactList = '+filterContactList);
        for(EmailAssignmentWrapperClass con : filterContactList){
            if(con.isCheck){
                selectedContactList2.add(con);
            }
        }
        system.debug('selectedContactList2 = '+selectedContactList2);
        //system.debug('selectedContactList2 = '+selectedContactList2.size());
        emailListToSend.clear();
        for(EmailAssignmentWrapperClass con : selectedContactList2){
            emailListToSend.add(con.contact.email);
        }
        if(attachmentChecked==false){
            if(emailListToSend.size()>0 ){
                Messaging.SingleEmailMessage singleEmailMessage = new Messaging.SingleEmailMessage();
                singleEmailMessage.setToAddresses(emailListToSend);
                singleEmailMessage.setSubject('Apex Email Example');
                singleEmailMessage.setPlainTextBody('Hi Admin, \n Please check email');
                
                Messaging.SingleEmailMessage[] singleEmailMessages = new Messaging.SingleEmailMessage[]{singleEmailMessage};
                    Messaging.sendEmail(singleEmailMessages);
            }
        }else{
            if(emailListToSend.size()>0 ){
                for(EmailAssignmentWrapperClass con : selectedContactList2){
                    List<string> emailValuesList = new List<String>();
                    
                    emailValuesList.add(con.contact.email);
                    system.debug('emailValuesList'+emailValuesList);
                    string recordId = con.contact.Id;
                    system.debug('recordId'+recordId);
                    
                    Messaging.SingleEmailMessage singleEmailMessage = new Messaging.SingleEmailMessage();
                    singleEmailMessage.setToAddresses(emailValuesList);
                    singleEmailMessage.setSubject('Apex Email Example With Attachment');
                    singleEmailMessage.setPlainTextBody('Hi Admin,\nPlease find the attachment.');
                    
                    
                    Attachment[] attachment2 = [Select Id, Name, Body From Attachment where ParentId =: recordId];
                    
                    if(attachment2.size() > 0){
                        Attachment attachment = [Select Id, Name, Body From Attachment Where ParentId =: recordId];
                        Messaging.EmailFileAttachment emailFileAttachment = new Messaging.EmailFileAttachment();
                        emailFileAttachment.setBody(attachment.Body);
                        emailFileAttachment.setFileName(attachment.Name);
                        
                        Messaging.EmailFileAttachment[] emailFileAttachments = new Messaging.EmailFileAttachment[]{emailFileAttachment};
                            
                            singleEmailMessage.setFileAttachments(emailFileAttachments);
                    }
                    
                    Messaging.SingleEmailMessage[] singleEmailMessages = new Messaging.SingleEmailMessage[]{singleEmailMessage};
                        Messaging.SendEmailResult[] results = Messaging.sendEmail(singleEmailMessages);
                    
                    if(results[0].success) {
                        System.debug('Email send successfully');
                    } else {
                        System.debug('Error : ' + results[0].errors[0].message);
                    }
                    
                }
                
            }
        }
        
        //system.debug('emailListToSend = '+emailListToSend);
        // ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter value'));
        
        PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
        system.debug(pageRef);
        pageRef.setRedirect(true);
        return pageRef;
        //return null;
    }
    
    public void handelWithAttachmentChecked(){
        system.debug('attachmentChecked'+attachmentChecked);
    }
    
    
    public List<EmailAssignmentWrapperClass> filterContactList{get;set;}
    public class EmailAssignmentWrapperClass{
        public Boolean isCheck{get;set;}
        public Contact contact {get;set;}
        public Attachment attachment{get;set;}
    }    
}