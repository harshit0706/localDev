import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
import {encodeDefaultFieldValues} from 'lightning/pageReferenceUtils'

export default class NavigateToObjectPage extends NavigationMixin(LightningElement) {


    navigateToNewRecord(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'contact',
                actionName:'new'
            }
        })
    }
    navigateToNewRecordDefaultValues(){
        const defaultValues = encodeDefaultFieldValues({
            FirstName: 'LWC',
            LastName: 'Component',
            LeadSource: 'Other'
        })
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'contact',
                actionName:'new'
            },
            state:{
                defaultFieldValues: defaultValues
            }
        }) 
    }

    navigateToListView(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'contact',
                actionName:'list'
            },
            state:{
                filterName: 'Recent'
            }
        })
    }
    navigateToFile(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'ContentDocument',
                actionName:'home'
            }
        })
    }
}