global class invoiceScheduleClass implements Schedulable {
    
    public static String sch =  '0 43 12 * * ? *';
    
        global static String scheduleInvoice() {
           invoiceScheduleClass  schedulebatch = new invoiceScheduleClass(); 
            return System.schedule('My batch Job', sch, schedulebatch);
        }
    
    global void execute(SchedulableContext sc) 
    {
        invoiceBatchExample b = new invoiceBatchExample();
        String jobID =	  database.executeBatch(b);
        System.debug('schedule executed');
        
    }
    
}