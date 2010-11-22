// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults



$(function() {
    $('a.enable-disable').click(function() {
        if($(this).data('status') == 'enabled') {
            $('this').data('status','disabled');
            return true;
        } else {
            $(this).parents('form').submit();
            $(this).data('status','enabled');
            return false;
        }
    });
    $("#minutes").change(function(){
        $("#minutes-display").html($(this).val());
        $("#minutes-slider").slider("value", $(this).val());
    });
    $("#minutes").change();
    
    //datepicker stuff
    $(".datepicker").each(function(){
        $(this).datepicker({
        	firstDay: 1,
        	numberOfMonths: 1,
        	prevText: '«',
        	nextText: '»',
        	beforeShow: function(input, inst) {
        		setTimeout(function(){$(".ui-datepicker").css("z-index", 99);}, 10);
        	}
        });  
        /*dayNamesMin: I18n.t('js.date.abbr_day_names'),
    	dateFormat: I18n.t('js.date.format'),
    	monthNames: I18n.t('js.date.month_names'),*/
    });
    //Slider
    $(".slider").each(function(){
        initSliderFromField(this, $('#' + $(this).data('for')));
    });
    $("#minutes-slider").bind( "slidechange", function(event, ui){
        var minutes = ui.value;
        $("#minutes").val(minutes);
        $("#minutes-display").html(minutes);
    });
});

function initSliderFromField(slider_element, input) {
    var min = parseInt(input.attr('min'));
    var max = parseInt(input.attr('max'));
    var step = parseInt(input.attr('step'));
    var value = parseInt(input.attr('value'));

    $(slider_element).slider({
        min:min,
        max:max,
        step:step,
        value:value,
    });
}