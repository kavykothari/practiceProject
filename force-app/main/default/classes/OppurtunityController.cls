public class OppurtunityController {
    public Opportunity opportunity{get;set;}
    public Boolean isLoad{get;set;}
    public string PageUrl{get;set;}
    
    
    public OppurtunityController(ApexPages.StandardController controller){
        opportunity = new Opportunity();
        Id accountId = controller.getId();
        Opportunity.AccountId = accountId;
        PageUrl ='/'+accountId;
        
    }
    public void HandelInlineSave(){
        try{
            isLoad=true;
            insert Opportunity;
        }catch(Exception ex){
            ApexPages.addMessages(ex);
        }
    }

}