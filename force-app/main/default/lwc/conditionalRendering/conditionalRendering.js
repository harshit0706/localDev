import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    isVisible = false
    name
    handleClick(){
        this.isVisible = true
    }

    typeHandler(event){
        this.name = event.target.value
    }
    get textVerifier(){
        return this.name === 'hello'
    }
}