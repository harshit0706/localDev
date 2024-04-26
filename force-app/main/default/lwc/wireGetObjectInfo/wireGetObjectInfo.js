import { LightningElement, wire} from 'lwc';
import {getObjectInfo , getObjectInfos} from 'lightning/uiObjectInfoApi'
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity'

export default class WireGetObjectInfo extends LightningElement {
    // defaultRecordTypeId 0125g000000ZOstAAG
    @wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
    objectInfo

    objectApiNames = [ACCOUNT_OBJECT,OPPORTUNITY_OBJECT]
    objectInfos
    @wire(getObjectInfos, {objectApiNames: '$objectApiNames'})
    objectInfoHandler({data}){
        console.log('in a objectinfos')
        if(data){
            console.log('objectinfos' + data)
            this.objectInfos = data
        }
    }
}