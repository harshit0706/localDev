import { LightningElement } from 'lwc';
import hasViewAllData from '@salesforce/userPermission/viewAllData'
export default class CheckPermissions extends LightningElement {
    get hasViewAllDataAvailable(){
        return hasViewAllData
       
    }
}