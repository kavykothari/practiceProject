public  class opportunityControllerLWC {
    public opportunityControllerLWC() {

    }
    @AuraEnabled(cacheable = true)
    public static List<Opportunity> getOpportunityList(){
        return [select Id, AccountId, Name, Amount, CloseDate, StageName from Opportunity];
 
    }

    @AuraEnabled
    public static Opportunity viewOpportunityList(string oppId){
        return [select Id, Stage_Type__c, Type, OwnerId, Discount__c, AccountId, Name, Amount, CloseDate, StageName from Opportunity where Id =:oppId];
    }

    @AuraEnabled
    public static list<Opportunity> searchOppValue(string getValue){
        if(string.isBlank(getValue)){
            return [select Id, Stage_Type__c, Type, OwnerId, Discount__c, AccountId, Name, Amount, CloseDate, StageName from Opportunity ];
       }
       else {
        return [select Id, Stage_Type__c, Type, OwnerId, Discount__c, AccountId, Name, Amount, CloseDate, StageName 
                from Opportunity
                where Name Like : + '%' + getValue + '%' ];
       }
    }

    @AuraEnabled
    public static string deleteOpportunityList(string oppId2){

        try{
            delete [select Id from Opportunity where Id =:oppId2];
            return 'success';
        }
        catch(Exception e){
            return 'error';
        }
    }


}