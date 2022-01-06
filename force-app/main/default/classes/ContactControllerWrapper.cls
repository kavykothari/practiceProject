public class ContactControllerWrapper {
    public List<Contact> contactList{get;set;}
    public List<ContactControllerWrapp> contactWrappList{get;set;}
    public List<ContactControllerWrapp> contactWrappList2{get;set;}
    public List<ContactControllerWrapp> contactWrappList3{get;set;}
   
    public List<Contact> conList{get;set;}
    
    
    public ContactControllerWrapper(){
        contactWrappList= new List<ContactControllerWrapp>();
        contactWrappList2= new List<ContactControllerWrapp>();
        contactWrappList3= new List<ContactControllerWrapp>();
       
        contactList = new List<Contact>();
        contactList = [select Id,FirstName, LastName, Email,Experience__c , Phone from Contact];
        Integer count = 1;
        for(Contact con : contactList){
            ContactControllerWrapp ccw = new ContactControllerWrapp();
            ccw.contact = con;
            ccw.index = count++;
            
            contactWrappList.add(ccw);
            
        }
       
    }
     public void HandelCheckBox(){
         contactWrappList2.clear();
         for(ContactControllerWrapp ccw : contactWrappList){
             contactWrappList2.add(ccw);
             
         }
         //contactWrappList3.clear();
         
         
      //   system.debug('contactWrappList2'+contactWrappList2); 
         //system.debug('onchange working ');
      //   system.debug('size of contactWrappList2 '+contactWrappList2.size());

        }
    
   
        
    
    public class ContactControllerWrapp{
        public Contact contact{get;set;}
        public Integer index{get;set;}
        public Boolean isCheck{get;set;}
        public Integer isDelete{get;set;}
        public ContactControllerWrapp(){
            contact = new Contact();
            	
        }
    }
     public void saveButton(){
         conList = new List<Contact>();
         for(ContactControllerWrapp ccw2 : contactWrappList2){
             if(ccw2.isCheck){
                 conList.add(ccw2.contact);
             }
             
         }
         
          //system.debug('contactWrappList3'+contactWrappList3);
         //upsert ContactControllerWrapp.contact(contactWrappList3);
         upsert conList;
      
    }
    public void deleteData(){
       /*contactWrappList3.clear();
         for(ContactControllerWrapp ccw3 : contactWrappList){
             if(ccw3.isDelete!=Null){
                 contactWrappList3.add(ccw3);
                 contactWrappList.remove(ccw3.isDelete);
             }
             //ContactControllerWrapp.isDelete = true;
    }
        system.debug('deleteed temproray value '+contactWrappList3);*/
    }

}