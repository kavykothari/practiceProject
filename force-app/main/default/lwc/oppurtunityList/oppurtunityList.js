import { LightningElement, wire, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {refreshApex} from '@salesforce/apex';
import getOpportunityList from '@salesforce/apex/opportunityControllerLWC.getOpportunityList';
import viewOpportunityList from '@salesforce/apex/opportunityControllerLWC.viewOpportunityList';
import deleteOpportunityList from '@salesforce/apex/opportunityControllerLWC.deleteOpportunityList';
import searchOppValue from '@salesforce/apex/opportunityControllerLWC.searchOppValue';

export default class OppurtunityList extends LightningElement {
opportunityList;
viewListData;
name;
amount;
accountId;
closeDate;
discount;
oppOwner;
stageType;
type;
finalAns;
idOfRecord;
wireList;
@wire(getOpportunityList) accList(result) {
    this.wireList = result;
}

showToast() {
    const event = new ShowToastEvent({
        title: 'Successfully Deleted',
        message: 'Recorded Successfully Deleted',

    });
    this.dispatchEvent(event);
}
//Boolean tracked variable to indicate if modal is open or not default value is false as modal is closed when page is loaded 
@track isModalOpen = false;
closeModal() {
    // to close modal set isModalOpen tarck value as false
    this.isModalOpen = false;

}
submitDetails() {
    // to close modal set isModalOpen tarck value as false
    //Add your code to call apex method or do some processing
    this.isModalOpen = false;
}

@track isModalOpen2 = false;
closeModal2() {
// to close modal set isModalOpen tarck value as false
this.isModalOpen2 = false;
}

@wire (getOpportunityList) getAllOpportunity({error,data}){
    if(data){
        console.log("@@"+data);
        this.opportunityList = data;
    }else{
        console.log("@2"+error);
    }
}
handelViewButton(event){
    this.isModalOpen = true;
    const Id = event.target.value;
    //alert(Id);
    viewOpportunityList({oppId : Id}).then(result =>{
            //console.log(result);
            this.name = result.Name;
            this.amount= result.Amount;
            this.accountId= result.AccountId;
            this.closeDate= result.CloseDate;
            this.discount= result.Discount__c;
            this.oppOwner= result.OwnerId;
            this.stageType= result.Stage_Type__c;
            this.type= result.Type;
    }).catch(error => {
        console.log("Error"+error);

    });
}
handelSearch(){
    var searchValue = this.template.querySelector(".searchvalue").value;
    searchOppValue({getValue : searchValue}).then(result =>{
        console.log("@@"+result);
        this.opportunityList =result;
    }).catch(error =>{
        console.log("error"+error);
    })

    //alert("searchValue"+searchValue);
}

handelDeleteButton(event){
    console.log("@@");
    this.idOfRecord = event.target.value;
    //alert("idOfRecord = "+this.idOfRecord);
    this.isModalOpen2 = true;     
}

submitDetails2() {
    console.log("ok is working");
    console.log("%%"+this.idOfRecord);
    //handelDeleteRecords()        
    deleteOpportunityList({oppId2 : this.idOfRecord}).then(result =>{
        console.log("handelDeleteRecords working");
        console.log(result);
        if(result == 'success'){
            this.finalAns='yes';
            this.isModalOpen2 = false;
            this.showToast();
            return refreshApex(this.wireList);
        }else{
            console.log("handelRecord not worked");
            this.isModalOpen2 = false;

        }
}).catch(error => {
    console.log("Error"+error);

});
}
}