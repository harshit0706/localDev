import { LightningElement } from 'lwc';
import getAccountList from '@salesforce/apex/lwcAccountController.getAccountList'
import findAccount from '@salesforce/apex/lwcAccountController.findAccount'

export default class ImperativeApexCall extends LightningElement {

    searchKey
    accounts
    timer
    handleClick(){
        getAccountList().then((result)=>{
            console.log(result)
            this.accounts = result
        }) .catch(error=>{
            console.error(error)
        })
    }


    searchHandler(event){
        window.clearTimeout(this.timer)
        this.searchKey = event.target.value
        this.timer = setTimeout(()=>{
            this.callApex()
        },2000)
        
    }
    callApex(){
        findAccount({searchKey:this.searchKey}).then(result=>{
            this.accounts = result
        }).catch(error=>{
            console.error(error)
        })
    
    }
    
    
}