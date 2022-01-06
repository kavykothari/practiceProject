/**
Name		: SearchContactController
Date		: 20 Oct, 2021
Author		: Kavya Kothari
Description : In this Assignment I had Worked on Pagination And How to Handel Buttons Nevigation.
-----
------
*/

public class SearchContactController {
    public List<Contact> contactList{get;set;}
    public List<Contact> tempContactList;
    public String getTextVlaue{get;set;}
    public Integer pageSize{get;set;}
    public Integer pageNumber{get;set;}
    
    public SearchContactController() {
        pageNumber = 0;
        pageSize = 100;
        contactList = new List<Contact>();
        tempContactList = [SELECT Id, Name, Email, Account.Name, Phone, Type__c FROM Contact];
        contactList = tempContactList;
    }
    
    public void doSerach() {
        tempContactList = new List<Contact>();
        tempContactList = [SELECT Id, Name, Email, Account.Name, Phone, Type__c
                           FROM Contact 
                           where Name LIKE:'%'+ getTextVlaue +'%' or Email LIKE:'%'+ getTextVlaue +'%'];
        serachandLimit();
    }
    
    public void serachandLimit() {
        contactList = new List<Contact>();
        Integer executeValue = pageSize;
        pageNumber = 1;
        if(tempContactList.size() < executeValue) {
            executeValue = tempContactList.size();
        }
        for(integer count = 0; count < executeValue; count++ ) {
            contactList.add(tempContactList.get(count));
        }
    }
    
    public void limitContactData() {
        serachandLimit();
    }
    
    public void firstPage() {
        pageNumber = 1;
        pagination();
    }
    
    public  void pagination() {
        pageNumber--;
        Integer count = pageSize * pageNumber;
        system.debug('page number in pagination = '+pageNumber);
        pageNumber++;
		system.debug('page number in pagination = '+pageNumber);

        Integer lastSize = pageSize * pageNumber;
        if(tempContactList.size() < lastSize) {
            lastSize = tempContactList.size();
        }
        contactList = new List<contact>();
        for(; count < lastSize; count++) {
            contactList.add(tempContactList.get(count));
        }
    }
    
    public void previousPage() {
        pageNumber--;
        pagination();
    }
    
    public void nextPage() {
        pageNumber++;
        pagination();
    }
    
    public void lastPage() {
        pageNumber = ((tempContactList.size() - math.mod(tempContactList.size(),pageSize)) / pageSize)+1;
        pagination();
    }
    
    public Boolean getFirstAndPrevious() {
        if(pageNumber == 0 || pageNumber == 1) {
            return true;
        } else {
            return false;
        }
    }
    public Boolean getLastAndNext(){
        Integer totalcontact = tempContactList.size();
        Integer lastPageNumber = ((totalcontact - math.mod(totalcontact,pageSize)) / pageSize);
        if(pageNumber ==  lastPageNumber + 1 || totalcontact < pageSize ) {
            return true;
        } else {
            return false;
        }
    }
}