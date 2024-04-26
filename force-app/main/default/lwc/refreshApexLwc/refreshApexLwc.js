import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/lwcAccountController.getAccountList'
import { updateRecord } from 'lightning/uiRecordApi'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {refreshApex} from '@salesforce/apex'

const columns = [
    {label : 'Name' ,fieldName: 'Name', editable:true},
    {label : 'Type' ,fieldName: 'Type', editable:true},
    {label : 'Industry' ,fieldName: 'Industry', editable:true}
]
export default class RefreshApexLwc extends LightningElement {
    columns = columns
    draftValues=[]
    @wire(getAccountList)accounts
    handleSave(event){
        console.log('handle save=> ' , event.detail.draftValues)
        console.log(event.detail.draftValues)
        const recordInputs = event.detail.draftValues.slice().map(draft=>{
            const fields = Object.assign({}, draft)
            return {fields}
        })
        console.log("recordInputs", recordInputs)
        const promises = recordInputs.map(recordInput=>{updateRecord(recordInput)})
        Promise.all(promises).then(result=>{
            this.showToastMsg('Success', 'Contacts updated')
            this.draftValues = []
            return refreshApex(this.accounts)
        }).catch(error=>{
            this.showToastMsg('Error creating record', error.body.message, error)
        })
    }
    showToastMsg(title, message, variant){
        this.dispatchEvent(
            new ShowToastEvent({
                title:title,
                message:message,
                variant:variant||'success'
            })
        )
    }
}