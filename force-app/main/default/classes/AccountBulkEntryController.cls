public class AccountBulkEntryController {
    public List <Account> addaccountList{get;set;}
    public Integer Count;
        public Integer c1;
    public String AccountName{get;set;}

    
    
    public AccountBulkEntryController(){
        count=1;
        addaccountList= new List<Account>();
        
        addaccountList.add(new Account());
        
        
    }
    public void SaveBulkEntry(){
        system.debug('yes working of AddBulkEntry');
        try
        {
            
            system.debug('yes working of try'+AccountName);
            insert addaccountList;
            
        }catch(Exception ex){
            ApexPages.addMessages(ex);
        }
    }
    
    public void AddBulkEntry(){
        if(count>10){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'You Can not Add Row,The Maximum Row size is 10'));
        }else{
                addaccountList.add(new Account());
            system.debug('yes working of AddBulkEntry');
            Count++;

        }
        
    }
    
    public void RemoveBulkEntry(){
        if(count>1){
              system.debug('yes working of RemoveBulkEntry');
        Integer Cal=addaccountList.size() -1;
        addaccountList.remove(Cal);
        Count--;

        }else{
			system.debug('yes working of else part in remove');
                  ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'You Can not Remove/Delete Row,The Row Can not Be less than 1'));
			
        }
        
      
        
        
        //  system.debug('yes working of RemoveBulkEntry'+addaccountList.remove(cal));
        
        
        //for()

    }
    
}