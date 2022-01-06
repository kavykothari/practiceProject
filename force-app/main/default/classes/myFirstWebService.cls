@RestResource(urlMapping='/getContactInfo/*')
global class myFirstWebService{
    
    @HttpGet
    global static List<Contact> getContact(){
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        List<Contact> contactList = new List<Contact>();
        contactList = [select Id, Name, Phone from Contact];
        return contactList;
    }
}