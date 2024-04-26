import { LightningElement } from 'lwc';
import pubSub from 'c/pubSub'
export default class PubSubComponentB extends LightningElement {
    connectedCallback(){
        this.callSubscriber()
    }
    callSubscriber(){
        pubSub.subscribe('componentA', (message)=>{
            this.message = message
        })
    }
}