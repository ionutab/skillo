/**
 * Created by ionutab on 9/13/2014.
 */

var SkilloSelect2QualificationsFormatting = (function(){

    var formatQualificationSelection = function (item) {
        return item.name;
    };

    var formatQualificationResult = function(item) {
        return item.name;
    };

    return {
        formatQualificationSelection:formatQualificationSelection,
        formatQualificationResult:formatQualificationResult
    };

})();
var SkilloSelect2MultipleQulificationInitiator = (function(){

    var doWeHaveAQualificationAlready = "Select one or more qualifications";
    var ajaxURL = null;

    var init = function(path){
        ajaxURL = path;
    };

    var state = function(){
        console.log("ajaxURL: " + ajaxURL);
    };

    var select2onID = function(itemID){
        console.log("Select2 on " +itemID);
        $(itemID).select2({
            placeholder: doWeHaveAQualificationAlready,
            allowClear: true,
            multiple: true,
            ajax:{
                url: ajaxURL,
                data: function(term, page){
                    return {inputCode: term};
                },
                results: function (data, page) {
                    return {results: data};
                }
            },
            initSelection: function(element, callback) {
                var data = [{ id: 'user0', name: 'Disabled User'}, { id: 'user1', name: 'Jane Doe'}];
                /*
                    $(element.val().split(",")).each(function(i) {
                        var item = this.split(':');
                        data.push({
                            id: item[0],
                            name: item[1]
                        });
                    });
                */
                //$(element).val('');
                callback(data);
            },
            formatSelection: SkilloSelect2QualificationsFormatting.formatQualificationSelection,
            formatResult: SkilloSelect2QualificationsFormatting.formatQualificationResult,
            escapeMarkup: function (m) { return m; }
        });
    };

    return {
        init:init,
        state:state,
        select2onID:select2onID
    };

})();

var SkilloSelect2SimpleQualificationInitiator = (function(){

    var doWeHaveAQualificationAlready = "Select one or more qualifications";
    var ajaxURL = null;

    var init = function(path){
        ajaxURL = path;
    };

    var state = function(){
        console.log("ajaxURL: " + ajaxURL);
    };

    var select2onID = function(itemID){

        var itemPlaceholder = itemID + 'Placeholder';
        var itemSelect2jQuerySelector = "#s2id_" + itemID + " .select2-chosen";

        $(itemID).select2({
            placeholder: doWeHaveAQualificationAlready,
            allowClear: true,
            ajax:{
                url: ajaxURL,
                dataType: 'json',
                data: function(term, page){
                    return {inputCode: term};
                },
                results: function (data, page) {
                    return {results: data};
                }
            },
            initSelection: function(element, callback) {
                var id=$(itemID).val();
                if (id!=="") {
                    $(itemSelect2jQuerySelector).html($(itemPlaceholder).val());
                }
            },
            formatSelection: SkilloSelect2QualificationsFormatting.formatQualificationSelection,
            formatResult: SkilloSelect2QualificationsFormatting.formatQualificationResult,
            escapeMarkup: function (m) { return m; }
        });
    };

    return {
        init:init,
        state:state,
        select2onID:select2onID
    };
})();