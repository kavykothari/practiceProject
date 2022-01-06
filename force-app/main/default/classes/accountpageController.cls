public class accountpageController {
    public List<Account> accountList{get;set;}
    public List<Contact> contactList{get;set;}
    public String accountName {get;set;}
    public String accid {get;set;}
    public Contact con {get;set;}
    public Account acc {get;set;}
    public  List<SelectOption> accountdata{get;set;}
    public  accountpageController(){
        accountList = new List<Account>();
        contactList = new List<Contact>();
        con = new Contact();
        acc = new Account();
        accid = ApexPages.currentPage().getParameters().get('id');
        //accid=
        //string nameaccount= Id.valueOf(accid);    
        accountdata = new List<SelectOption>();
        accountList = [Select id, Name From Account];
        contactList =[Select id, LastName, AccountID, Phone, Email, FirstName, Account.Rating  From Contact];
        accountData.add(new SelectOption('' , '--None--'));
        for(Account acc : accountList){
            accountData.add(new SelectOption(acc.Id,acc.Name));
        }
    }
    public PageReference showAccount(){
        PageReference myPage = new PageReference('/apex/contact_new_page?id='+accountName);
        myPage.setRedirect(true);
        return myPage;
    }
    
    public PageReference saveContact() {
        con.AccountId = accid ;
        insert con;
        // System.debug('hii'+con);
        PageReference myPage = new PageReference('/apex/contact_detail_page');
        myPage.setRedirect(true);
        return myPage;
    }
}