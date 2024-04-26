import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'

export default class NavigateToAura extends NavigationMixin(LightningElement)  {
    navigateToAura(){
        this[NavigationMixin.Navigate]({
            type:'standard__component',
            attributes:{
                componentName:'C__navigationAuraTarget'
            },
            state:{
                'c__id':'123456789'
            }
        })
    }
}