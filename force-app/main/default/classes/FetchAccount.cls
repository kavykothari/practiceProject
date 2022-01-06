@RestResource(urlMapping='/v1/getAccounts/*')
global with sharing class FetchAccount {
    @HttpGet
    @AuraEnabled
    global static list<account> fetchAccount(){
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        List<account> listAccount =[Select Id, Name, Phone from Account];
                 system.debug('@@2'+listAccount);
        return listAccount ;
    }
    
  
}