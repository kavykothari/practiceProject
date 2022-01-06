public class listexample {
    public listexample() {
        system.debug('list example');
        List<string> citylist = new List<string>();
        citylist.add('delhi');
        citylist.add('jodhpur');
        citylist.add('punjab');
        citylist.add('rajasthan');
        citylist.add('ahemdabad');
        
        system.debug(citylist);
        
        List<string> extracity = new List<string>{'banlore','karnataka','ajmer'};
        citylist.addall(extracity);
        system.debug(extracity);
        system.debug(citylist);
        system.debug('size of list = '+ citylist.size());
        system.debug('value of 2 index = '+ citylist.get(2));
        
        integer i = 0;
        for(string city : citylist){
            system.debug(i + 'index' +   city);
            i++;
        }
        
        string removedvalue= citylist.remove(2);
        system.debug(removedvalue);
        system.debug(citylist);
        
        /*citylist.add(2,'alwar');
                system.debug(citylist); 
*/

       //  citylist.set(2,'Bikaner');
        //        system.debug(citylist);
        
      
                 //method 1 for coping the list from 1 to another
      /*  List <string> duplicatelist= new List<string>(); 
                duplicatelist.addall(citylist);

               system.debug(' duplicatelist '+duplicatelist);
*/

        
                 //method 2 for coping the list from 1 to another
        
      //    List <string> duplicatelist2= new List<string>(citylist); 
        
     //  system.debug(' duplicatelist2 '+duplicatelist2);
        
                  //method 3 for coping the list from 1 to another
			
        List <string> duplicatelist3= citylist.clone(); 
         system.debug(' duplicatelist3 '+duplicatelist3);
        
         duplicatelist3.clear(); 
         system.debug(' clearing list '+duplicatelist3);
        
        Boolean Isexist = citylist.contains('Bikaner');
            if(Isexist){
                
                         system.debug(' yes exist  ');
            }else{
                                         system.debug(' Not exist  ');

            }

        if(citylist.equals(duplicatelist3)){
                      system.debug(' Yes Equal ');

            
        } else{
                       system.debug(' Not Equal ');

        }

        
        if(citylist.isempty()){
                                   system.debug(' Yes Empty ');

            
        }else{
                                    system.debug(' Not Empty ');

        }
        citylist.sort();
        
       system.debug(' sorting  = '+citylist);

    

    }
}