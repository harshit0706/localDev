import { LightningElement, wire } from 'lwc';
import filterAccountByType from '@salesforce/apex/lwcAccountController.filterAccountByType'
export default class WireApexParams extends LightningElement {
    selectedType = ''
    @wire(filterAccountByType,{type:'$selectedType'})
    filteredAccounts
    get typeOptions(){
        return [
            {label:"Customer - Direct", value:"Customer - Direct"},
            {label:"Customer - Channel", value:"Customer - Channel"},
            {label:"Prospect", value:"Prospect"}
        ]
    }
    typeHandler(event){
        this.selectedType = event.target.value
    }
}