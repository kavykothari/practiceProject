public class TestingMapController {
            public List <Id> accListOfId;
    public Map<Id,Account> accMap;


    public static void TestingMapController(){
        List <Account> accList = new List<Account>([select Id, name from Account]);
        List <Id> accListOfId = new List<Id>();
        Map<Id,Account> accMap = new Map<Id,Account>([select Id, name from Account]);
                system.debug('accMap = '+accMap);



        system.debug('account list = '+accList);
        for(Account acc : accList) {
           // accMap.put(acc.Id,acc);
            accListOfId.add(acc.Id);
        }
        system.debug('id of acc = '+accListOfId);
        
    }

}