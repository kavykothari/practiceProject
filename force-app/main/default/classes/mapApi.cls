@RestResource(urlMapping='/Route_Station__c/*')
global with sharing class mapApi { 
    @HttpGet
    global static List<wrapperclass> doGet() {
        string currentStation;
        String distinationStation;
        set<Route_Station__c> setId=new set<Route_Station__c>();
        set<Id> setIdOfRoute =new set<Id>();
        List<Route_Station__c> routeStationList = new List<Route_Station__c>();
        List<Route_Station__c> detailList = new List<Route_Station__c>();

        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String routeStationId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        String[] stringArray = routeStationId.split(',');
        system.debug(stringArray);
        system.debug(routeStationId);
        currentStation=stringArray[0];
        system.debug('@@'+currentStation);
        distinationStation=stringArray[1];
        system.debug('@@1'+distinationStation);
        
        if(currentStation=='') {
            system.debug('null current');
        }
        
        if(distinationStation=='') {
            system.debug('null distinationStation');
        }
        
        routeStationList  = [SELECT Id FROM Route_Station__c WHERE Name = :distinationStation];
        system.debug('@routeStationList@1'+routeStationList);
        for(Route_Station__c rr : routeStationList){
            setId.add(rr);
        }
       // system.debug('setId = '+setId);
       // system.debug('distinationStation = '+distinationStation);
        
        detailList =  [SELECT Id, Name, Distance__c  ,Previous_Station__r.Name, Main_Route__r.Name 
                       FROM Route_Station__c 
                       WHERE Name =:currentStation AND Previous_Station__c IN : setId];
        
        system.debug('detailList'+detailList);
        List<wrapperclass> lstwrapeer=new List<wrapperclass>();
        for(Route_Station__c rr1 : detailList){
            wrapperclass wrapperObj=new wrapperclass();
            wrapperObj.roadRoute=rr1.Main_Route__r.Name;
            wrapperObj.distanceOfRouteStation = rr1.Distance__c;
            lstwrapeer.add(wrapperObj);
            if(rr1.Main_Route__c!=null) {
                setIdOfRoute.add(rr1.Main_Route__c);
            }
        }
        system.debug('wraperclass = '+lstwrapeer);
        system.debug('see == '+setIdOfRoute);
        return lstwrapeer;
    }
    
    global class wrapperclass {
        public string roadRoute{get; set;}
        public decimal distanceOfRouteStation{get; set;}
        
    }
    
}