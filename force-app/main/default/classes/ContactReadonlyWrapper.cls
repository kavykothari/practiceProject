public class ContactReadonlyWrapper {
    public List<ContactWrapper> ContactWrapperList{get;set;}
    public List<Contact> ContactList{get;set;}
    public integer rem;
    
    public ContactReadonlyWrapper(){
        ContactWrapperList = new List<ContactWrapper>();
        List<Contact> ContactList = [select Id, FirstName, LastName, Email, Phone from Contact];
         integer count=1;
        for(Contact con : ContactList){
            ContactWrapper contactwrapper = new ContactWrapper();
            contactwrapper.index = count++;
            contactwrapper.contact = con;
            ContactWrapperList.add(ContactWrapper);
        }
      
    }
    
    public class ContactWrapper{
        public integer index {get;set;}
        public Contact contact {get;set;}
        public Boolean isCheck{get;set;}
    }
    public void handelSelectedContact(){
        ContactList = new List<Contact>();
        for(ContactWrapper contactwrapper : ContactWrapperList){
            if(contactwrapper.isCheck){
                
               // System.debug(contactwrapper.index);
                ContactList.add(contactwrapper.contact);
               // ContactWrapperList.remove(contactwrapper.index);

               
               // system.debug('contact wrapper list = '+ContactWrapperList);
               // system.debug('index of contact list = '+ContactList.indexof(contactwrapper.contact));
            }
       			   
        }
    }

}