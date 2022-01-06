global class invoiceBatchExample implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
         system.debug('hi1');
        String query = 'select Id,name,AccountId,CreatedDate from Contact where CreatedDate = THIS_MONTH and Id not In (SELECT Contact__c FROM Invoice__c)';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> accList) {
        system.debug('hi'+accList);
        
        if(accList.size()>0) {
            list<Invoice__c> invoiceList = new list<Invoice__c>();
            for(Contact con : accList ) {
                //system.debug('values == '+ con);
                Invoice__c invoice = new Invoice__c();
                invoice.Amount__c = 1000;
                invoice.Contact__c = con.Id;
                invoice.Month__c = Datetime.now().format('MMMMMMMM');
                invoice.Year__c = String.valueOf(date.today().Year());
                invoice.Account__c = con.AccountId;
                invoiceList.add(invoice);
            }
            insert invoiceList;
        }
    }
    
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
   /*global void execute(SchedulableContext SC) {
        invoiceBatchExample batch = new invoiceBatchExample();
        Database.executeBatch(batch);
     //Select u.Name, u.Email, u.SmallPhotoUrl, u.FullPhotoUrl From User u
    }*/
    
}