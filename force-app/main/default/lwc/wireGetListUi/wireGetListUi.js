import { LightningElement , wire} from 'lwc';
import { getListUi } from 'lightning/uiListApi';
import ACCOUNT from '@salesforce/schema/Account'
import ACCOUNT_NAME from '@salesforce/schema/Account.Name'

export default class WireGetListUi extends LightningElement {
    Accounts=[]
    pageToken = null
    nextPageToken = null
    previousPageToken = null

    @wire(getListUi,{
        objectApiName:ACCOUNT,
        listViewApiName:'AllAccounts',
        pageSize:10,
        sortBy:ACCOUNT_NAME,
        pageToken:'$pageToken'
    })
    listViewHandler({data,error}){
        if(data){
            // console.log('getListUidata')
            console.log(data)
            this.Accounts = data.records.records
            this.nextPageToken = data.records.nextPageToken
            this.previousPageToken = data.records.previousPageToken
        }
        if(error){
            console.error(error)
        }
    }
    handlePreviousPage(){
        this.pageToken = this.previousPageToken
    }
    handleNextPage(){
        this.pageToken = this.nextPageToken
    }
}