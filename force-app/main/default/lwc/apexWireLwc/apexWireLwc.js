import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/lwcAccountController.getAccountList'

export default class ApexWireLwc extends LightningElement {

    accountList
    @wire(getAccountList) 
    accounts

    @wire(getAccountList)
    accountsHandler({data, error}){
        if(data){
            this.accountList = data.map(item=>{
                let newType = item.Type === '' ? 'BLANK': item.Type 
                return {...item, newType}
            })
        }
        if(error){
            console.error(error)
        }
    }

}