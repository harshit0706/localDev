@RestResource(urlMapping='/studentsInfo/*')
global class restApiApexClass 
{
    global class studentInfo
    {
        string studentName{get;set;}
        string studentAddress{get;set;}
        string studentPhone{get;set;}
        string schoolName{get;set;}
    }

    @httpGet
    global static studentInfo getStudent(){
        RestRequest request = RestContext.Request;
        system.debug(request);
        system.debug(request.requestURI);
        string studentId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Student__c student =  [SELECT id, Student_Name__c, Address__c, Phone_Number__c, School__r.Name 
                                 FROM Student__c 
                                 WHERE id = :studentId];
        studentInfo stdInfo = new studentInfo();
        stdInfo.studentName = student.Student_Name__c;
        stdInfo.studentAddress =student.Address__c;
        stdInfo.studentPhone = student.Phone_Number__c;
        stdInfo.schoolName = student.School__r.Name ;

        return stdInfo;
    }
}
