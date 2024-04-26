import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class Notifications extends LightningElement {
    toastHandlerSuccess(){
        this.showToast("Success","{0} Account Creation Done {1}","success")
    }
    toastHandlerError(){
        this.showToast("Error","Account Creation Failed","error")
    }
    toastHandlerWarning(){
        this.showToast("Warning","Warning","warning")
    }
    toastHandlerInfo(){
        this.showToast("Info","Information ","info")
    }
    showToast(title,message,variant){
        const event = new ShowToastEvent({
            title,
            message,
            variant,
            messageData:[
                'salesforce',{
                    url:'http://www.salesforce.com/',
                    label: 'Click Here'
                }
            ],
            mode:'sticky'
        })
        this.dispatchEvent(event)
    }
}