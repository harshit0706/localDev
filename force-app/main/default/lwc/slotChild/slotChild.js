import { LightningElement } from 'lwc';

export default class SlotChild extends LightningElement {
    handleFooterChange(){
        const footerElem = this.template.querySelector('.slds-card_footer')
        if(footerElem){
            footerElem.classList.remove('slds-hide')
        }
    }
}