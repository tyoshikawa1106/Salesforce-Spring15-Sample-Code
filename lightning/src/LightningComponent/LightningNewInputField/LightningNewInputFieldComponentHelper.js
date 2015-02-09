({
    helperMethod : function(component) {
        // ui:inputText
        var inputTextField  = component.find("ui-inputText");
        var inputText = inputTextField.get("v.value");
        var outputTextField = component.find("ui-outputText");
        var outputText = outputTextField.set("v.value", inputText);
        // ui:inputCurrency
        var inputCurrencyField  = component.find("ui-inputCurrency");
        var inputCurrency = inputCurrencyField.get("v.value");
        var outputCurrencyField = component.find("ui-outputCurrency");
        var outputCurrency = outputCurrencyField.set("v.value", inputCurrency);
        // ui:inputEmail
        var inputEmailField  = component.find("ui-inputEmail");
        var inputEmail = inputEmailField.get("v.value");
        var outputEmailField = component.find("ui-outputEmail");
        var outputEmail = outputEmailField.set("v.value", inputEmail);
        // ui:inputSecret
        var inputSecretField  = component.find("ui-inputSecret");
        var inputSecret = inputSecretField.get("v.value");
        var outputSecretField = component.find("ui-outputSecret");
        var outputSecret = outputSecretField.set("v.value", inputSecret);
        // ui:inputRichText
        var inputRichTextField  = component.find("ui-inputRichText");
        var inputRichText = inputRichTextField.get("v.value");
        var outputRichTextField = component.find("ui-outputRichText");
        var outputRichText = outputRichTextField.set("v.value", inputRichText);
        // ui:inputTextArea
        var inputTextAreaField  = component.find("ui-inputTextArea");
        var inputTextArea = inputTextAreaField.get("v.value");
        var outputTextAreaField = component.find("ui-outputTextArea");
        var outputTextArea = outputTextAreaField.set("v.value", inputTextArea);
    }
})
