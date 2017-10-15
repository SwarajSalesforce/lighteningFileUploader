public class FileUploadController {
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

}