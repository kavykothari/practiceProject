trigger RouteStationTrigger on Route_Station__c (before insert, after insert, after update,after delete) {
    public List <Route_Station__c> routeList = new List <Route_Station__c>(Trigger.New);// = Trigger.New;
    
    if( trigger.isinsert || trigger.isupdate ) {
        RouteStationTriggerHelper.triggerValidation(routeList);
    }
    
    if( trigger.isdelete) {
        routeList = Trigger.old;
    }
    
    if(routeList.size()>0) {
         RouteStationTriggerHelper.TotalDisCountFunctnalty(routeList);
    }
}