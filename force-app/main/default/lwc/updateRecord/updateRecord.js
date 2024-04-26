import { LightningElement, wire } from 'lwc';
import {getListUi} from 'lightning/uiListApi'
import {updateRecord} from 'lightning/uiRecordApi'

import CONTACT from '@salesforce/schema/Contact'
const COLS = [
    {label:'Id', fieldName: 'Id'},
    {label:'Name', fieldName: 'Name'},
    {label:'Title', fieldName: 'Title'},
    {label:'Phone', fieldName: 'Phone' , editable:true},
    {label:'Email', fieldName: 'Email', type:'tel', editable:true}

]
export default class UpdateRecord extends LightningElement {
    contacts=[]
    columns = COLS
    draftValues=[]
    @wire(getListUi,{
        objectApiName: CONTACT,
        listViewApiName: 'AllContacts'
    })listViewHandler({data, error}){
        if(data){
            console.log('update record module')
            console.log(data)
            this.contacts = data.records.records.map(item=>{
                return {
                    "Id": this.getValues(item,'Id'),
                    "Name": this.getValues(item,'Name'),
                    "Title": this.getValues(item,'Title'),
                    "Phone": this.getValues(item,'Phone'),
                    "Email": this.getValues(item,'Email')
                }
            })
        }
        if(error){
            console.error(error)
        }
    }
    getValues(data, field){
        return data.fields[field].value
    }
    handleSave(event){
        console.log('update record module2')

        console.log(JSON.stringify(event.detail.draftValues))
        const recordInputs=event.detail.draftValues.map(draft=>{
            const fields={...draft}
            return{fields:fields}
        })
        const promises = recordInputs.map(recordInput=>updateRecord(recordInput))
        Promise.all(promises).then(()=>{
            console.log('Contact updated successfully')
            this.draftValues = []
        }).catch(error=>{
            console.error('Error updating record', error)
        })
        
    }
}