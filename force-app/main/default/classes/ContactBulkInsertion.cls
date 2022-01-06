public class ContactBulkInsertion {
    public contact Contact{get;set;}
    public List<Contact> BulkInsertContactList{get;set;}
    public ContactBulkInsertion(){
        BulkInsertContactList = new List<Contact>();
        BulkInsertContactList.add(new Contact());
        BulkInsertContactList.add(new Contact());
        BulkInsertContactList.add(new Contact());

    }
    
    public void savebutton(){
        system.debug('yes save button is working');
        try{
            insert Contact;
        }
        catch(Exception ex){
            ApexPages.addMessages(ex);            
        }
    }
    
     public void cancelbutton(){
        system.debug('yes cancel button is working');
    }
}