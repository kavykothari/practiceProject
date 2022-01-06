public class LeadController {
    public Lead /*objecct name*/ lead{get;set;} /*variable name and it is declared (Unknown property 'LeadController.lead' - so we use get and set)*/
    public List<Lead> Leadlist{get;set;} //ye banana padda if we want to make new variable
    public Id leadId{get;set;}
    public Integer resultsize{get;set;}
    public List<Lead> tempLeadList;
    
    public Integer pageSize{get;set;} //using this for custom page display record and we didnt use get set so we cant use it at vf page
    public Integer PageNumber{get;set;}
     public Integer Nextt{get;set;}
    public  integer backpagenumber{get;set;}
    
    public LeadController() //  constructor = LeadController()
    {
        system.debug('execute the lead controller');
        lead = new Lead(); //initialize of lead meansn isko memory di h abhi
        
        Leadlist=new List<lead>();
        Nextt=0;
        backpagenumber=0;
        PageSize=10;
        PageNumber=1;
      //  Leadlist= [select Id,FirstName,LastName,Company,State,Email,Status,Phone from lead]; 
        tempLeadList= [select Id,FirstName,LastName,Company,State,Email,Status,Phone from lead];
        system.debug(tempLeadList.size());
        resultsize=tempLeadList.size();
        
        for(Integer count=0; count<PageSize;count++)
        {
            Leadlist.add(tempLeadList.get(count));
        }
        
       Id recordId= Apexpages.currentPage().getParameters().get('editId'); //yaha pe editId ki value ko get kr rhe h
        system.debug('record id get = '+recordId); // recordId ek variable jo ki editId ki value store krega
        if(recordId!=NULL)
        {
          lead= [select Id,FirstName,LastName,Company,State,Email,Status,Phone from lead where Id=:recordId]; //  (=:) this sign is use in query for assigning values  
            
        }
        
         system.debug('result size'+resultsize);       
        system.debug('page size'+PageSize);       
        system.debug('page number'+PageNumber);       

        
    }
    //public PageReference addLead() //Method - addLead() yaha pe - (void) hatake we put (PageReference) bcz to redirect the page and to get the return value
   
    
    public PageReference addLead() //Method - addLead() yaha pe - (void) hatake we put (PageReference) bcz to redirect the page and to get the return value

        
    {
        system.debug(' @@ - add lead button working'+lead);
         PageReference pg= new PageReference('/apex/Lead_list_view'); //(PageReference) - use to redirect to another page.
        pg.setRedirect(true);

        
        try		 //(ye lagane se wo jopure page pe gandi si error atih wo nh aayegi and program atrleast execute hoga)
        {
            system.debug('try method is working properly');
                if(lead.Id==NULL)
            {
                
            insert lead; //insert DML
            
           /*
            system.debug('id of detail page is = '+lead.Id);
            PageReference pg= new PageReference('/' +lead.Id); //(PageReference) - use to redirect to another page.
            pg.setRedirect(true);
            return pg;
			*/
             }
            else
            {
                update lead;
            }
        }
        catch(Exception ex)
        {
            system.debug('');
            ApexPages.addMessages(ex); // message throw krwana hai for error, ye error dene ka kam krega vfp (pagemessages) wo shoe krwane ka kam krega
           // return null;
        }
        
		return pg;        
        
        
    }
    public PageReference editlead()
    {
        system.debug('llll'+leadId);
         //PageReference pg= new PageReference('/' +leadId);
        PageReference pg= new PageReference('/apex/add_new_lead?editId=' +leadId); //editId variable h jo ki leadId store kr rha hai
        pg.setRedirect(true);
        return pg;
        
    }
    
    public PageReference deletelead()
    {
        system.debug('delete link working properly');
        delete[select Id from Lead where Id=:leadId];
         PageReference pg= new PageReference('/apex/Lead_list_view'); //(PageReference) - use to redirect to another page.
        pg.setRedirect(true);
        return pg;
        
    }
    
    public void LeadNextButton(){
        if(Nextt==0){
                         system.debug(' yes working lead next bbutton');
                        Integer count=PageSize*PageNumber;
                    PageNumber++;
                    integer copyofpagesize=PageSize*PageNumber;
                    system.debug('temp lead size = '+tempLeadList.size());
                    system.debug('temp lead size = '+copyofpagesize);
            
                    if(tempLeadList.size() < copyofpagesize)
                    {
                        copyofpagesize=tempLeadList.size();
                        Nextt++;
                    }
                    
                    Leadlist= new List<Lead>();
                    for(;count < copyofpagesize;count++)
                    {
                        Leadlist.add(tempLeadList.get(count));
                    }
                    system.debug('@@ page size = '+PageSize);
                            system.debug('@@ page number = '+PageNumber);

        }else{
                        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'There Are  No More Entry'));

        }
        
    }
    
	public void LeadPreviousButton(){
      
                backpagenumber=PageNumber;
                backpagenumber--;
                backpagenumber--;
        if(backpagenumber==-1){
                                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'You Are Already On First Page'));

        }else{
                           system.debug('@@back page number 1= '+backpagenumber);

        
                    Integer count1 =PageSize*backpagenumber;
                backpagenumber++;
                integer copyofpagesize1=PageSize*backpagenumber;
               
        
           
                Leadlist= new List<Lead>();
                for(;count1 < copyofpagesize1;count1++)
                {
                    Leadlist.add(tempLeadList.get(count1));
                }
                system.debug('@@ page size = '+PageSize);
                PageNumber--;
                                system.debug('@@back page number2 = '+backpagenumber);
        
                Nextt=0;

        }
                         
             
    }
    
    public void FirstButton(){
         Nextt=0;
        system.debug(' yes working lead first bbutton');
         PageSize=10;
        PageNumber=0;
        integer tillpgno=PageSize;
    
        Leadlist= new List<Lead>();
        for(;PageNumber < PageSize;PageNumber++)
        {
            Leadlist.add(tempLeadList.get(PageNumber));
        }
        PageSize=10;
        PageNumber=1;
        
      
    }
    
    public void LastButton(){
        
        
        system.debug('total size of record'+ tempLeadList.size());
        integer totalrecords=tempLeadList.size();
        decimal d1=tempLeadList.size();
        decimal d2=10;
        
        decimal deciml=d1/d2;
        Integer int1 = Integer.valueOf(deciml);
        decimal point_last_decimal_value=deciml-int1;
        Integer int2 =Integer.valueOf(point_last_decimal_value*10);
        Integer Summ=(int1+int2)*10;
        
                system.debug('int1 value '+ int1);
                        system.debug('int2 value '+ int2);
                                system.debug('sum '+ Summ);
                                        system.debug('totalrecords '+ totalrecords);

        if(summ!=totalrecords){
            system.debug('not equal');
                        
            
        Integer int3 =PageSize*(int1+1);
        Integer int4 =PageSize*(int1);
                          
            Leadlist= new List<Lead>();
        for(;int4 < totalrecords;int4++)
        {
            Leadlist.add(tempLeadList.get(int4));
        }

        }else{
            system.debug('yes  equal');
            
            Integer int4 =PageSize*(int1-1);
            
            Leadlist= new List<Lead>();
            for(;int4 < totalrecords;int4++)
            {
                Leadlist.add(tempLeadList.get(int4));
            }
            
        }
        
        
        


         
         
        /*system.debug(' yes working lead first bbutton');
         PageSize=10;
        PageNumber=0;
        integer tillpgno=PageSize;
    
        Leadlist= new List<Lead>();
        for(;PageNumber < PageSize;PageNumber++)
        {
            Leadlist.add(tempLeadList.get(PageNumber));
        }
        PageSize=10;
        PageNumber=1;
        */
        system.debug('result size'+resultsize);       
        system.debug('page size'+PageSize);       
        system.debug('page number'+PageNumber);       


    }

}