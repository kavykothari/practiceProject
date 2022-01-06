public class SetExample {
    public SetExample(){
        set <string> food = new set<string>();
       			 food.add('vadapav');
               
        		food.add('chowmin');

                food.add('panner tikka');

                food.add('dosa');

        system.debug(food);
        
        
        // The set elements in s2 are copied from s1
             set <string> food2 = new set<string>(food);
                system.debug(food2);

       // listToCopy Elements are copied from the list to this set
        
        list <string> extrafood= new list<string>{'momos','paneer roll','spring roll'};
	             set <string> foodupdate = new set<string>(extrafood);
 					                system.debug(foodupdate);
            
        foodupdate.addall(food);
  		  system.debug(foodupdate);
        
        set<string> allfromset = new set<string>{'panner butter masala','tanduri tadka','sevtamatar'};
        allfromset.addall(foodupdate);
          		  system.debug(allfromset);
                  		  system.debug(food);


    if(food.containsall(food2))
    {
                          		  system.debug('yes contain all element ');

    }else{
                                  		  system.debug('not contain all element ');

    }
        



    
    
    
     if(food.contains('chowmin'))
    {
                          		  system.debug('yes contain chowmin ');

    }else{
                                  		  system.debug('not contain');

    }
        


            Set<String> myString = new Set<String>{'a', 'b','z'};
            Boolean result = myString.contains('z');
            System.assertEquals(false, result);
        
        
    
    
    }

}