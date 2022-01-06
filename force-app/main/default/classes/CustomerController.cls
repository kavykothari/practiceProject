public class CustomerController {
    public Customer__c customer {get;set;}
    public List<Customer__c> Customerlist{get;set;}
    public List<Customer__c> tempLeadList;
    public List<Customer__c> DetailList{get;set;}
    public string searchValue{get;set;}
    public string cusId{get;set;}
    public Id customerId{get;set;}
    public Integer PageNumber{get;set;}
    public Integer PageSize{get;set;}

		

    
    public CustomerController(){
        system.debug('yes constructorworking');
        customer= new Customer__c();
        DetailList= new List<Customer__c>();
        PageNumber=1;
            PageSize=8;
            tempLeadList= [select Id,First_Name__c,Last_Name__c,Gender__c,Email__c,Phone__c from Customer__c];
        Customerlist=new List<Customer__c>();
        Customerlist= [select Id,First_Name__c,Last_Name__c,Gender__c,Email__c,Phone__c from Customer__c];
    
        
        system.debug(tempLeadList);
        
         Id recordId= Apexpages.currentPage().getParameters().get('editId'); //yaha pe editId ki value ko get kr rhe h
         Id CloneId=Apexpages.currentPage().getParameters().get('CloneId'); 
         DetailList=[select Id,First_Name__c,Last_Name__c,Gender__c,Address__c,City__c,Married__c,Nationality__c,OwnerId,Email__c,Phone__c from Customer__c where Id=:recordId];

      //  system.debug('record id get = '+recordId); // recordId ek variable jo ki editId ki value store krega
        if(recordId!=NULL)
        {
          customer= [select Id,First_Name__c,Last_Name__c,Gender__c,Address__c,City__c,Married__c,Nationality__c,OwnerId,Email__c,Phone__c from Customer__c where Id=:recordId]; //  (=:) this sign is use in query for assigning values             
        }else if(CloneId!=NULL){
           	customer= [select Id,First_Name__c,Last_Name__c,Gender__c,Address__c,City__c,Married__c,Nationality__c,OwnerId,Email__c,Phone__c from Customer__c where Id=:CloneId]; //  (=:) this sign is use in query for assigning values             
       		customer.Id=NULL;
        }

        
    }
    
    public PageReference AddCustomer(){
        system.debug('yes add customer button is working');
        customer.Id=NULL;
       
        try		 //(ye lagane se wo jopure page pe gandi si error atih wo nh aayegi and program atrleast execute hoga)
        {
            system.debug('try method is working properly');
             if(customer.Id==NULL)
            {
            
            	insert customer; //insert DML
                 PageReference pg= new PageReference('/apex/Customer_List_view'); //(PageReference) - use to redirect to another page.
      			  pg.setRedirect(true);
                return pg; 
            }else{
                
                update customer;
                 PageReference pg= new PageReference('/apex/Customer_List_view'); //(PageReference) - use to redirect to another page.
      			  pg.setRedirect(true);
                return pg; 
            }
            
                        /*
            system.debug('id of detail page is = '+lead.Id);
            PageReference pg= new PageReference('/' +lead.Id); //(PageReference) - use to redirect to another page.
            pg.setRedirect(true);
            return pg;
            */
        }
        catch(Exception ex)
        {
            system.debug('');
            ApexPages.addMessages(ex); // message throw krwana hai for error, ye error dene ka kam krega vfp (pagemessages) wo shoe krwane ka kam krega
        }
        		       return null;
		
        
    }
    
    public PageReference EditCustomer(){
        system.debug('yes edit customer link working');
         {
        system.debug('llll'+customerId);
         //PageReference pg= new PageReference('/' +leadId);
        PageReference pg= new PageReference('/apex/add_new_customer?editId=' +customerId); //editId variable h jo ki leadId store kr rha hai
        pg.setRedirect(true);
        return pg;
        
    }
    }
    
    public PageReference DeleteCustomer()
    {
        system.debug('delete link working properly');
        delete[select Id from Customer__c where Id=:customerId];
        PageReference pg= new PageReference('/apex/Customer_List_view'); //(PageReference) - use to redirect to another page.
        pg.setRedirect(true);
        return pg;
        
    }
    
    public PageReference CloneCustomer(){
        system.debug('clone link is working');
         //PageReference pg= new PageReference('/' +leadId);
        PageReference pg= new PageReference('/apex/add_new_customer?editId=' +customerId); //editId variable h jo ki leadId store kr rha hai
        pg.setRedirect(true);
        return pg;
        
    }
    
     public PageReference savenew(){
        system.debug('yes add customer button is working');
         try{
            	insert customer; //insert DML
                 PageReference pg= new PageReference('/apex/add_new_customer'); //(PageReference) - use to redirect to another page.
      			  pg.setRedirect(true);
                return pg; 
         }catch(Exception ex)
        {
            ApexPages.addMessages(ex); // message throw krwana hai for error, ye error dene ka kam krega vfp (pagemessages) wo shoe krwane ka kam krega
        	return null;
        }
   
            
}
        
     public PageReference ViewCustomer(){
       
                 PageReference pg= new PageReference('/apex/detail_customer?editId='+cusId);
      			  pg.setRedirect(true);
                return pg; 
            
}
    
    public PageReference BackButton(){
         PageReference pg= new PageReference('/apex/Customer_List_view'); //(PageReference) - use to redirect to another page.
      			  pg.setRedirect(true);
                return pg; 
        
    }
    public void SearchCustomer(){
        system.debug('SearchCustomer yes working'+searchValue);
        if(!string.isEmpty(searchValue)){
              Customerlist= [select Id,First_Name__c,Last_Name__c,Gender__c,Email__c,Phone__c 
                             from Customer__c 
                             where First_Name__c LIKE : '%' + searchValue + '%' 
                            	OR Last_Name__c LIKE : '%' + searchValue + '%'];
        }else{
            			ListPagination();        

        }
    }
        
        private void ListPagination(){
            PageNumber=1;
            system.debug('list size'+tempLeadList.size());
            tempLeadList= [select Id,First_Name__c,Last_Name__c,Gender__c,Email__c,Phone__c from Customer__c];
            system.debug('list size'+tempLeadList);
            CustomerList.clear();
            for(Integer count = 0; count <tempLeadList.size() ; count++){
                CustomerList.add(tempLeadList.get(count));
                
                
            }               



        }
    
}