import { LightningElement } from 'lwc';

export default class Looping extends LightningElement {
    carList = ['verna','ford','nexon','nano','fortuner']
    ceoList = [
        {
            id:1,
            Company:'apple',
            name:'tim cook'
        },
        {
            id:2,
            Company:'amazon',
            name:'jeff bezzos'
        },
        {
            id:3,
            Company:'facebook',
            name:'zuckerburg'
        },
        {
            id:4,
            Company:'google',
            name:'sundar pichai'
        }
    ]
}