({
    onFileUploaded:function(component,event,helper){
        helper.show(component,event);
        var files = component.get("v.fileToBeUploaded");
         var recordId = component.get("v.recordId");
        console.log('recordId: ' + recordId);
        if (files && files.length > 0) {
            var file = files[0][0];
            var reader = new FileReader();
            reader.onloadend = function() {
                var dataURL = reader.result;
                var content = dataURL.match(/,(.*)$/)[1];
                helper.upload(recordId,component, file, content, function(answer) {
                    if (answer) {
                        helper.hide(component,event);
                        // Success
                    }
                    else{
                        // Failure
                    }
                });
            }
            reader.readAsDataURL(file);
        }
        else{
            helper.hide(component,event);
        }
    }
})