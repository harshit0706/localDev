import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CONTACT from '@salesforce/schema/Contact'

import CONTACT_NAME from '@salesforce/schema/Contact.Name'
import CONTACT_TITLE from '@salesforce/schema/Contact.Title'
import CONTACT_ACCOUNT from '@salesforce/schema/Contact.AccountId'
import CONTACT_EMAIL from '@salesforce/schema/Contact.Email'
import CONTACT_PHONE from '@salesforce/schema/Contact.Phone'



export default class RecordEditForm extends LightningElement {
    inputValue=''
    objectName = CONTACT
    fields={
        contactAccount: CONTACT_ACCOUNT,
        contactName: CONTACT_NAME,
        contactTitle: CONTACT_TITLE,
        contactEmail: CONTACT_EMAIL,
        contactPhone: CONTACT_PHONE
    }

    handleChange(event){
        this.inputValue = event.target.value
        console.log(this.inputValue)
    }

    handleSubmit(event){
        event.preventDefault()
        const inputCmp = this.template.querySelector('lightning-input')
        const value = inputCmp.value
        if(!value.includes('+91')){
            inputCmp.setCustomValidity("The phone number must include '+91'")
        }else{
            inputCmp.setCustomValidity("")
            console.log('event-'+event.detail)

            const fields = event.detail.fields
            console.log('fields-'+fields)
            console.log('value-'+value)

            fields.Name = value
            this.template.querySelector('lightning-record-edit-form').submit(fields)
        }
        inputCmp.reportValidity()
    }

    handleSuccess(event){
        const toastEvent = new ShowToastEvent({ 
            title:"Contact created",
            message: "Record ID: "+ event.detail.id,
            variant:"success"
        })
        this.dispatchEvent(toastEvent)
    }

    handleError(event){
        const toastEvent = new ShowToastEvent({ 
            title:"Error creating Account",
            message: event.detail.message,
            variant:"error"
        })
        this.dispatchEvent(toastEvent)
    }

    handleReset(){
        const fields = this.template.querySelectorAll('lightning-input-field')
        if(fields){
            Array.from(fields).forEach(field => {
                field.reset()
            });
        }
    }
}