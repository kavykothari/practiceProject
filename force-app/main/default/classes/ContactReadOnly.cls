public class ContactReadOnly {
    public List<WrapperContact> wrapperContactList{get;set;}
    public List<Contact> contact{get;set;}
    public string CHeckBoxValue{get;set;}
    public Boolean r1{get;set;}
    public Boolean r2{get;set;}
    public Integer indexx{get;set;}
    public integer rno{get;set;}
    public String recordId{get;set;}
    public string paramValues{get;set;}
    public List<integer> Contact2{get;set;}
    
   public ContactReadOnly(){
       r2=true;
       
       contact = new List<Contact>();
        contact2 = new List<integer>();
       //contact = ;
       System.debug('hi cominh ');
       wrapperContactList = new List<WrapperContact>();
       for(Contact conRec : [select Id, FirstName, LastName, Email from Contact]) {
           wrapperContactList.add(new WrapperContact(conRec)); 
       }
       
                
       system.debug('wrapperContactList'+wrapperContactList.size());

    }
    public void DeleteValue(){
        system.debug('checkbox'+CHeckBoxValue);
    }
    public void handelcheckAction(){
        system.debug('recordId = '+ recordId);
        system.debug('indexx'+indexx);
        system.debug('paramValues'+paramValues);
    }
    public void SaveButton(){
        System.debug('saving');
        try{
             update contact;
        }catch(Exception ex){
            ApexPages.addMessages(ex);
        }
       
    }
    
    public class WrapperContact{
        public Integer index;
        public Contact conObj{get;set;}
        public WrapperContact(Contact conObj){
            this.conObj = conObj;
        }
    }
}