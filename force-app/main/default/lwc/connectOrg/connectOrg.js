import { LightningElement } from 'lwc';
import fetchAccount from '@salesforce/apex/FetchAccount.fetchAccount';

export default class ConnectOrg extends LightningElement {
    connectedCallback(){
        fetchAccount().then(result=>{
            console.log('@2kavya = ',result);
        }).catch(error =>{
            console.log('error');
        });
    }
    
}