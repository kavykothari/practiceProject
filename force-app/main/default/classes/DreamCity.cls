public class DreamCity{
    public string getedvalue{get;set;}
    public List <SelectOption> selectedinputList{get;set;}
    public Integer indexx{get;set;}
    
    public DreamCity(){
        selectedinputList = new List<SelectOption>();
      //   selectedinputList.add(new SelectOption('--none--','--None--'));
       // selectedinputList.add(new SelectOption(getedvalue,getedvalue));
        
        
    }
    public void addButton(){
        system.debug('see the value of input textbox = '+getedvalue);
        if(string.isEmpty(getedvalue)){
           // selectedinputList.add(new SelectOption('--none--','--None--'));
        }else{
            selectedinputList.add(new SelectOption(getedvalue,getedvalue));
        }
        
    }
    public void removing(){
       	selectedinputList.remove(indexx - 1);
    }

}