public class CountryStateCityPincode {
    public string SelectedCountry{get;set;}
    public string SelectedState{get;set;}
    public string SelectedCity{get;set;}
    public string pincodechange{get;set;}
    public List<string> CheckboxSelectedCourse{get;set;}
    public List<string> CheckboxSelectedHobbies{get;set;}

    public string valueassigned{get;set;}
    public string SelectedStatus{get;set;}
    public string SelectedGender{get;set;}
    
    public string renderOfStatus{get;set;}
    public string renderOfgender{get;set;}

    public CountryStateCityPincode(){
        valueassigned='false';
        renderOfStatus='false';
        renderOfgender='false';
        CheckboxSelectedCourse=new List<string>();
        CheckboxSelectedHobbies= new List<string>();
        
       // SelectedCountry = new List <string>();
    }
    public  List<SelectOption> getCountryOptionList(){
        system.debug('country name='+SelectedCountry);
        
        List<SelectOption> CountryOptionList = new List<SelectOption>();
        CountryOptionList.add(new SelectOption('','--None--'));
        CountryOptionList.add(new SelectOption('india','India'));
        CountryOptionList.add(new SelectOption('united kingdom','United Kingdom'));
        return CountryOptionList;
    }
    public void handelCountryChange(){
        
    }
    
    public  List<SelectOption> getStateOptionList(){
        if(SelectedCountry=='india'){
            List<SelectOption> StateOptionList = new List<SelectOption>();
            StateOptionList.add(new SelectOption('','--None--'));
            StateOptionList.add(new SelectOption('rajsthan','Rajsthan'));
            StateOptionList.add(new SelectOption('delhi','Delhi'));
            return StateOptionList;
        }else if(SelectedCountry=='united kingdom'){
            List<SelectOption> StateOptionList = new List<SelectOption>();
            StateOptionList.add(new SelectOption('','--None--'));
            StateOptionList.add(new SelectOption('paris','Paris'));
            StateOptionList.add(new SelectOption('london','London'));
            return StateOptionList;
        }else{
            List<SelectOption> StateOptionList = new List<SelectOption>();
            StateOptionList.add(new SelectOption('','--None--'));
            return StateOptionList;
            
        }
        
       
    }
    public void handelStateChange(){
        
    }
    
      public  List<SelectOption> getCityOptionList(){
        if(SelectedState=='rajsthan'){
            List<SelectOption> CityOptionList = new List<SelectOption>();
            CityOptionList.add(new SelectOption('','--None--'));
            CityOptionList.add(new SelectOption('udaipur','Udaipur'));
            CityOptionList.add(new SelectOption('ajmer','Ajmer'));
            return CityOptionList;
        }else if(SelectedState=='delhi'){
            List<SelectOption> CityOptionList = new List<SelectOption>();
            CityOptionList.add(new SelectOption('','--None--'));
            CityOptionList.add(new SelectOption('firozobad','Firozobad'));
            CityOptionList.add(new SelectOption('shahjahanabad','Shahjahanabad'));
            return CityOptionList;
        }else if(SelectedState=='paris'){
            List<SelectOption> CityOptionList = new List<SelectOption>();
            CityOptionList.add(new SelectOption('','--None--'));
            CityOptionList.add(new SelectOption('Montmartre','Montmartre'));
            CityOptionList.add(new SelectOption('Eprney','eprney'));
            return CityOptionList;
        }
            
          else if(SelectedState=='london'){
            List<SelectOption> CityOptionList = new List<SelectOption>();
            CityOptionList.add(new SelectOption('','--None--'));
            CityOptionList.add(new SelectOption('hackney','Hackney'));
            CityOptionList.add(new SelectOption('homerton','Homerton'));
            return CityOptionList;
          }
            
            else{
            List<SelectOption> CityOptionList = new List<SelectOption>();
            CityOptionList.add(new SelectOption('','--None--'));
            return CityOptionList;
            
        }
        
       
    }
    public void handelCityChange(){
         system.debug('yes working pincodechange');
        
    }
    
    public void pincodechange(){
        system.debug('yes working pincodechange');
        if(SelectedCity=='hackney'){
            pincodechange='400706';
            
        }
        else if(SelectedCity=='hackney'){
            pincodechange='400706';
            
        }
        else if(SelectedCity=='hackney'){
            pincodechange='400706';
        }
        else if(SelectedCity=='hackney'){
            pincodechange='400706';
            
        }
        else{ pincodechange='400706';
             
    }
    }
    
    public void getcourse(){
        
        
    }
    
    public List<SelectOption> getHobbiesoptionList(){
        List<SelectOption> HobbiesoptionList = new List<SelectOption>();
        HobbiesoptionList.add(new SelectOption('playing','Playing'));
        HobbiesoptionList.add(new SelectOption('studing','Studing'));
        return HobbiesoptionList;
    }
    
      public void gethobbies(){
          if(CheckboxSelectedHobbies.isEmpty()){
                      valueassigned='false';

          }else{
                      valueassigned='true';

          }
    }
    
    public void status(){
        if(string.isEmpty(SelectedStatus)){
            renderOfStatus='false';
                }else{
                    renderOfStatus='true';
                }
    }
    public void removeStatus(){
        SelectedStatus='';
         renderOfStatus='false';
        
    }
    
    
     public void removeGender(){
        SelectedGender='';
         renderOfgender='false';
        
    }
    
    public List<SelectOption> GetradioButtonGender(){
          List<SelectOption> radioButtonGender= new List<SelectOption>();
        radioButtonGender.add(new SelectOption('male','Male'));
        radioButtonGender.add(new SelectOption('female','Female'));
        radioButtonGender.add(new SelectOption('others','Others'));
        return radioButtonGender;
    }
    public void getgender(){
        renderOfgender='true';	
        
    }

              
        
}