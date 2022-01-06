public class mapexample {
    public mapexample(){
        map<string,Integer> mymap= new map<string,integer>();
        mymap.put('udaipur', 313001);
        mymap.put('jaipur', 313002);
        mymap.put('jodhpur', 313003);
        mymap.put('delhi', 313004);
        mymap.put('mavli', 313005);
        mymap.put('ajmer', 313006);
        system.debug(mymap);
        //   mymap.clear();
        map<string,Integer> mymap2 = mymap.clone();
        system.debug(mymap2);
        
        if(mymap2.containskey('udaipur'))
        {
            system.debug('yes contain');
        }else{
            system.debug('not contain');
            
        }
        
        // if(mymap2.eqauls(mymap))
        if(mymap.equals( mymap2))
        {
            system.debug('yes equal');
        }else{
            system.debug('not equal');            
            
        }
        system.debug(mymap.get('udaipur'));
        
        
        
    }
}