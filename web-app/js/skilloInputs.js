var SkilloInputs = (function(){

    var applyTelephoneInputStates = function (inputMask, placeHolder){
        $(".telIM").inputmask(inputMask, {"placeholder":placeHolder});
    }

    return {
        applyTelephoneInputStates: applyTelephoneInputStates
    }

})();