/*********************************************************************************************************************
* Name             : AccountContactService
* Description      : This class will send list of Account with Contacts as response to the calling System
**********************************************************************************************************************/

@RestResource(urlMapping = '/AccountContactDetails/*')
global class AccountContactService{

    @HttpGet
       
    // ***************************************************************************************************
    // Method Name: getAccountContactInfo
    // Description: This method gets called for REST GET request.
    // Params: 
    // Return type :Void    
    //****************************************************************************************************

    global static void getAccountContactInfo() {
        list<lead> lstLead = new list<lead>();
       
      try{
            RestRequest req = RestContext.request;                        
            Map<String, String> jsonHeaderElements = new Map<String, String>();
            
            for(String param: RestContext.request.params.keySet()){
                jsonHeaderElements.put(param, RestContext.request.params.get(param));                
            }

            List<Account> accountList = new List<Account>([select id,name,phone,industry,(select lastName from contacts) from account Where Id IN (Select AccountId From Contact) limit 50]);
            
            RestContext.response.addHeader('Content-Type', 'application/json');
            RestContext.response.responseBody = Blob.valueOf(JSON.serialize(accountList));
            RestContext.response.statusCode=200;  
                          
            }
       catch(Exception e){  
            
        }
    
    }
    }