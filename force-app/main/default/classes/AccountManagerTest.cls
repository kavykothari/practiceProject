@isTest
public class AccountManagerTest {
@isTest
    static void testGetAccount(){
        Account AccRecord =new Account(Name='TestAccount');
        insert AccRecord;
        Contact ConRecord = new Contact(AccountId=AccRecord.Id,FirstName='Test',LastName='Test');
        insert ConRecord;
        RestRequest request = new RestRequest();
        System.debug('kkkk'+AccRecord.Id);
        request.requestUri = 'https://yourinstance.my.salesforce.com/services.apexrest/Accounts/'+AccRecord.ID+'/contacts';
       
        request.httpMethod = 'Get';
         System.debug('nnnnn'+request);
        RestContext.request = request;
        Account myAcct = AccountManager.getAccount();
        System.assert(myAcct!=null);
        System.assertEquals('TestAccount', myAcct.Name);
    }
}