public class RouteStationTriggerHelper {
    public static void triggerValidation(List<Route_Station__c> routeList) {
            system.debug('yes');

        for(Route_Station__c rs2 :routeList) {
            if(rs2.Previous_Station__c!=null && (rs2.Distance__c==null || rs2.Distance__c==0)){
                rs2.Distance__c.addError('Enter Distance'); 
            }
        }
    }
    
    public static void TotalDisCountFunctnalty(List<Route_Station__c> routeList){
        Set<Id> Ids = new Set<Id>();
        for(Route_Station__c rs :  routeList ) {
            //  system.debug('!!=='+rs.Previous_Station__c);
            Ids.add(rs.Main_Route__c);
        }
        //system.debug('!!=Ids='+Ids);
        if(Ids.size()>0) {
            List<Route__c> routeListFinal = new List<Route__c> ();
            Decimal count = 0.0;
            List<Route_Station__c> routeList1 = new List<Route_Station__c>([SELECT Id,Name, Distance__c,Previous_Station__c FROM Route_Station__c WHERE Main_Route__c IN : Ids]);
            List<Route__c> routeList3 = new List<Route__c>([SELECT Id,Name,Total_Distance__c FROM Route__c WHERE Id IN : Ids]);
            for(Route__c route : routeList3) {
                for(Route_Station__c routeStation : routeList1) {
                    count = count + routeStation.Distance__c;
                }
                route.Total_Distance__c = count;
                routeListFinal.add(route);
                update routeListFinal;
                // route.Route__c.Total_Distance__c = count;
            }
        }
        
    }
}