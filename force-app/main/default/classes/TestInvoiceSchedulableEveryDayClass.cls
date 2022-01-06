@istest
public class TestInvoiceSchedulableEveryDayClass {
    @istest
    public static void  testschedule() {
        
        Test.StartTest();
        invoiceScheduleClass.scheduleInvoice();
        Test.stopTest();   
    }
    
  @testSetup private static void setup() 
    {
        Account account = new Account();
        account.Name='Test Account';
        insert account;
        Contact contact = new Contact();
        contact.LastName = 'test Contact';
        contact.Experience__c=5;
        contact.AccountId = account.Id;
        insert contact;
          System.debug('hhh'+contact);
    }
    @isTest  static void testBatchable(){
      
        Test.startTest();
        invoiceBatchExample invoiceBatch = new invoiceBatchExample();
        Database.executebatch(invoiceBatch);
        Test.stopTest();
        List<Invoice__c> invoiceList = [SELECT Id FROM Invoice__c];
        System.assertEquals(1, invoiceList.size(), 'Invoice Not Created');     
    }
    
}