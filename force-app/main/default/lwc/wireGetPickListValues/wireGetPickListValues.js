import { LightningElement, wire } from 'lwc';
import { getPicklistValues, getObjectInfo } from 'lightning/uiObjectInfoApi'
import ACCOUNT_INDUSTRY from '@salesforce/schema/Account.Industry'
import ACCOUNT from '@salesforce/schema/Account'

export default class WireGetPickListValues extends LightningElement {
    selectedIndustry = '';
    industryOptions =[]

    @wire(getObjectInfo,{objectApiName:ACCOUNT})
    objectInfo

    @wire(getPicklistValues,{recordTypeId:'$objectInfo.data.defaultRecordTypeId', fieldApiName:ACCOUNT_INDUSTRY})
    industryPicklist({data,error}){
        if(data){
            console.log(data)
            this.industryOptions = [...this.generatePicklist(data)]
        }
        if(error){
            console.error(error)
        }
    }
    generatePicklist(data){
        return data.values.map(item=>({label:item.label,value:item.value}))
    }
    handleChange(event) {
        this.selectedIndustry = event.detail.value;
    }
}