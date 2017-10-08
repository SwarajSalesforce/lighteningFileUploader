({
    upload: function(recordId,component, file, base64Data, callback) {
        var action = component.get("c.uploadFile");
        console.log('type: ' + file.type);
        action.setParams({
            fileName: file.name,
            base64Data: base64Data,
            contentType: file.type,
            recordId:recordId
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS") {
                callback(a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    show: function (cmp, event) {
        var spinner = cmp.find("mySpinner");
        $A.util.removeClass(spinner, "slds-hide");
        $A.util.addClass(spinner, "slds-show");
    },
    hide:function (cmp, event) {
        var spinner = cmp.find("mySpinner");
        $A.util.removeClass(spinner, "slds-show");
        $A.util.addClass(spinner, "slds-hide");
    }
})