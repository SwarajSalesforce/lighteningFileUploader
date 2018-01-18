public class FileUploadController {
//Test Comment Added
    @AuraEnabled
    public static Id uploadFile(String fileName, String base64Data, String contentType,Id recordId) { 
        System.debug('recordId'+ recordId);
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        Attachment a = new Attachment();
        a.parentId = recordId;
        a.Body = EncodingUtil.base64Decode(base64Data);
        a.Name = fileName;
        a.ContentType = contentType; 
        insert a;
        System.debug(a.Id);
        return a.Id;
    }
        Description: This method is used to perform business logic on account After Insets
    */
    public static void accountAfterInsert(List<Account> accountList)
    {
        List<Account> accountOptionList = new List<Account>();
        Set<id> accId = new Set<Id>();
        
        for(Account accObj: accountList)
        {
            accId.add(accObj.id);
        }
        
        //Collect Account records for the update opration
        for(Account accObjItrate:[select id,Firstname__c,Business_Unique_Key_Text__c,CustomerType__c,AustralianDriversLicenseNumber__c,Type,Birthdate__c
                                 from Account where id in:accId])
                                 {
                                     accountOptionList.add(accObjItrate);
                                 } 

								 
                                 
        recursiveFlag = false;                      
         String [] AccountFields1  = new String [] {'Business_Unique_Key_Text__c'}; 
		 If(!CS_UtilityCRUDValidation.isUpdateable('Account',AccountFields1))           
            {           
                        
				update generateBusinessUniqueKey(accountOptionList);    
            }
		
	
    }

}
