import { LightningElement } from 'lwc';

export default class QuerySelectorDemo extends LightningElement {
    carList = ['verna','ford','nexon','nano','fortuner']
    clickHandler(){
        const elem = this.template.querySelector('h1')
        elem.style.border = '1px solid red'
        console.log(elem.innerText)

        const cars = this.template.querySelectorAll('.carName')
        Array.from(cars).forEach(item => {
            console.log(item.innerText)
            item.setAttribute('title',item.innerText)
        });
        const childElem = this.template.querySelector('.child')
        childElem.innerHTML = '<p class="slds-box slds-theme_shade">HTML form JS</p>'
    }
   
}