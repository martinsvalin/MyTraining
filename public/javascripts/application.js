// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {

    initEnableDisableWorkout();

    initDatePicker();

    createSlidersFromInputNumber();
    bindSliderChangeToDisplay("#training_duration");
    
    hideOtherPeoplesTrainings($('article.other'));

});

function createSlidersFromInputNumber(){
    $('input[type=number]').each(function() {
       $(this).after('<div id="' + this.id + '-slider" class="slider" data-for="' + this.id + '"></div>');
    });
    $(".slider").each(function(){
        createSlider(this, $('#' + $(this).data('for')));
    });
}

function createSlider(slider_element, input) {
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
    
    input.hide();
}

function bindSliderChangeToDisplay(element_id) {
    $(element_id).change(function(){
        $(element_id + "-display").html($(this).val());
        $(element_id + "-slider").slider("value", $(this).val());
    });
    $(element_id).change();
    
    $(element_id + "-slider").bind( "slidechange", function(event, ui){
        var minutes = ui.value;
        $(element_id).val(minutes);
        $(element_id + "-display").html(minutes);
    });
    
}

function initDatePicker() {
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
    });
}

function initEnableDisableWorkout() {
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
}

function hideOtherPeoplesTrainings(others) {
    if(others.length > 0) {
        others.hide();
        $('.actions').append('<a href="#" class="action-button show-more">Visa '+ others.length +' till.</a>');        
    }
    
    $('a.show-more').click(function() {
        others.show();
        return false;
    });
}