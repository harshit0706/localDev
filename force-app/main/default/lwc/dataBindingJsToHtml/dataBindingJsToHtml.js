import { LightningElement , track} from 'lwc';

export default class DataBindingJsToHtml extends LightningElement {
    fullName = 'Harshit'
    message
    changeHandler(event){
        this.message = event.target.value
    }

    address = {
        city: 'Agra',
        postalCose: '282007',
        state: 'UP'
    }

    trackHandler(event){
        this.address  = {...this.address , 'city' : event.target.value}
    }
    users = ['harshit','anil','deepak']
    num1=2
    num2=3

    get firstUsers(){
        return this.users[0]
    }
    get multiply(){
        return this.num1* this.num2
    }

}