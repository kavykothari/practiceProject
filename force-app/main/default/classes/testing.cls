public class testing {
     list<ContactWrapper> wrper;
    public void testing(){
       /* set<Contact> kavya = new set<Contact>([select id, Name, Title from Contact]);
        system.debug('set list =='+kavya);
        system.debug('set list =='+kavya.size());
        
        Contact con = new Contact();
        con.Id='0035g00000D21n8AAB';
        con.Title ='Andy Young';
        kavya.add(con);
        system.debug(' list =='+kavya);
        system.debug('list =='+kavya.size());
        
        List<Contact> kavya2 = new List<Contact>(kavya);
        system.debug(' list =='+kavya2);
        system.debug('list =='+kavya2.size());
       */ 
        list<ContactWrapper> wrper = new  list<ContactWrapper>();
        ContactWrapper contactWrapper = new ContactWrapper();
        
        list<user> userid = new list<user>();
        userid = [Select Id,Name, Email, SmallPhotoUrl From User ];
        system.debug('userid =='+userid);
        
        map<Id,task> tskListmap = new map<Id,Task>([select OwnerId, WhoId, Subject, Status, AccountId, priority from task where OwnerId in :userid]);
        //tskListmap = [select id, WhoId, Subject, Status, AccountId, OwnerId, priority from task where OwnerId in :userid];
        system.debug('tskList =='+tskListmap);  
        
        map<Id,contactWrapper> wrprMap = new map<Id,contactWrapper>();
        
        for(User u : userid){
            contactWrapper.ids = u.Id;
                contactWrapper.name = u.Name;
                contactWrapper.email = u.Email;
                contactWrapper.profileurl = u.SmallPhotoUrl;
            //contactWrapper.tsklistt = [select id, WhoId, Subject, Status, AccountId, OwnerId, priority from task where OwnerId =: u.Id];
            wrprMap.put( u.Id,contactWrapper);
           // wrper.add(contactWrapper);
          /*  for(Task t :[select id, WhoId, Subject, Status, AccountId, OwnerId, priority from task where OwnerId =: u.Id]){
                if(t.Id==u.Id){
                    contactWrapper.tsklistt = [select id, WhoId, Subject, Status, AccountId, OwnerId, priority from task where OwnerId =: u.Id];
                } Select u.Id,u.Name, u.Email, u.SmallPhotoUrl, u.FullPhotoUrl From User u
select id, WhoId, CreatedDate, Subject, Status, AccountId, OwnerId, priority from task where
            }*/
            
        }
        
        system.debug('hii kavya =='+ wrprMap);
            
        
        //update kavya2;
    }
      public class ContactWrapper{
        public Id ids {get;set;}
          public string name {get;set;}
           public string email {get;set;}
            public string profileurl {get;set;}
    }
    
}