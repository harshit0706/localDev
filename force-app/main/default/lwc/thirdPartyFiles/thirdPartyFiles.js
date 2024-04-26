import { LightningElement } from 'lwc';
import MOMENT from '@salesforce/resourceUrl/moment';
import {loadScript, loadStyle} from 'lightning/platformResourceLoader';
import ANIMATE from '@salesforce/resourceUrl/animate';
export default class ThirdPartyFiles extends LightningElement {
    currentDate = ''
    isLibLoaded = false
    renderedCallback(){
        if(this.isLibLoaded){
            return
        }else{
            Promise.all([
                loadStyle(this, ANIMATE+'/animate/animate.min.css'),
                loadScript(this, MOMENT+'/moment/moment.min.js')
            ]).then(()=>{
                this.setDateOnScreen()
            }).catch(error=>{
                console.error(error)
            })
            this.isLibLoaded = true
        }
        
    }
    setDateOnScreen(){
        this.currentDate = moment().format('LLLL')
    }
}