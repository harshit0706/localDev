import { LightningElement , wire} from 'lwc';
import id from '@salesforce/user/Id'
import {getRecord} from 'lightning/uiRecordApi'
import USER_NAME from '@salesforce/schema/User.Name'
import USER_EMAIL from '@salesforce/schema/User.Email'

const fields = [USER_NAME,USER_EMAIL]


export default class WireUserDetails extends LightningElement {
    // 0055g000007eIiOAAU
    userId = id
    userDetail
    @wire(getRecord, {recordId:'$userId', fields})
    userDetailHandler({data, error}){
        if(data){
            this.userDetail = data.fields
        }
        if(error){
            console.error(error)
        }    
    }

    @wire(getRecord, {recordId:'$userId', fields})
    userDetaiProperty
}