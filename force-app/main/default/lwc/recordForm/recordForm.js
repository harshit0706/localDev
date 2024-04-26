import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import ACCOUNT from '@salesforce/schema/Account'
import ACCOUNT_NAME from '@salesforce/schema/Account.Name'
import ACCOUNT_ANNUAL_REVENUE from '@salesforce/schema/Account.AnnualRevenue'
import ACCOUNT_TYPE from '@salesforce/schema/Account.Type'
import ACCOUNT_INDUSTRY from '@salesforce/schema/Account.Industry'

export default class RecordForm extends LightningElement {
    objectName = ACCOUNT
    fieldList = [ACCOUNT_NAME,ACCOUNT_ANNUAL_REVENUE,ACCOUNT_TYPE,ACCOUNT_INDUSTRY]

    successHandler(event){
        console.log(event.detail.id)
        const toastEvent = new ShowToastEvent({
                                title : "Account Created",
                                message : "Record Id: " + event.detail.id,
                                varint : "success"
                            })
        this.dispatchEvent(toastEvent)
    }
}