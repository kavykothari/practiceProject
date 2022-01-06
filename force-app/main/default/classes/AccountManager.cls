@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing  class AccountManager {
	@HttpGet
    global static Account getAccount(){
        //System.debug('hello');
        RestRequest request= RestContext.request;
        //System.debug('request.requestURI'+request.requestURI);
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        //System.debug('accountId'+accountId);
        Account result = [Select Id,Name,(Select Id,FirstName,LastName,Experience__c From Contacts)From Account Where Id=:accountId];
        return result;
    }
}