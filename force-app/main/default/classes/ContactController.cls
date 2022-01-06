public class ContactController {
    public List<Contact> contactList{get;set;}
    public List<Opportunity> opportunityData{get;set;}
    public List<Contact> contactData{get;set;}
    public String Name{get;set;}
    public Contact con {get;set;}
    public ContactController() {
        con = new Contact();
        contactList= new List<Contact>();
        contactList =[SELECT  AccountId, LastName, FirstName FROM Contact];
        contactData= new List<Contact>();
        for (Integer i = 1 ; contactData.size() <> 3 ; i++ ){
             contactData.add(new Contact());
        }
       
    }
    
    public void searchContact() {
        
        if((String.isBlank(Name) == True) && (con.accountId!=null)){ 
            contactList =[SELECT  AccountId, LastName, FirstName FROM Contact where AccountId =: con.accountId ];
        }else if((con.accountId == null) && (String.isBlank(Name) != True)){
            contactList =[SELECT  AccountId, LastName, FirstName FROM Contact where Name LIKE : '%' + Name + '%'];
            Name='';
        }else if((String.isBlank(Name) == True) && (con.accountId == null)){
            contactList =[SELECT  AccountId, LastName, FirstName FROM Contact];
        }else if((String.isBlank(Name) != True) && (con.accountId != null)){
            contactList =[SELECT  AccountId, LastName, FirstName FROM Contact where FirstName LIKE:'%'+ Name +'%' or LastName LIKE:'%'+ Name +'%' or AccountId =: con.accountId];
        }
    }
    
    public PageReference cancel() {
        PageReference myPage = new PageReference('/apex/contact_list');
        myPage.setRedirect(true);
        return myPage;
    }
    
    public void addRow() {
        contactData.add(new Contact());
    }
    
    public void removeRow() {
        if(contactData.size()==3){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,' Three row must be required '));
        }
        else{
            contactData.remove(contactData.size()-1);
            System.debug(contactData.size());
        }
    }
    
    public PageReference save() {
        insert contactData;
        PageReference myPage = new PageReference('/apex/contact_list');
        myPage.setRedirect(true);
        return myPage;
    }
    public void addContact(){
        
    }
    
    
}