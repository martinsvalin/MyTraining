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
    $("#training_duration").change(function(){
        $("#training_duration-display").html($(this).val());
        $("#training_duration-slider").slider("value", $(this).val());
    });
    $("#training_duration").change();
    $("#training_default_points").change(function(){
        $("#training_default_points-display").html($(this).val());
        $("#training_default_points-slider").slider("value", $(this).val());
    });
    $("#training_default_points").change();
    
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
    });
    //Slider
    $('input[type=number]').each(function() {
       $(this).after('<div id="' + this.id + '-slider" class="slider" data-for="' + this.id + '"></div>');
    });
    $(".slider").each(function(){
        initSliderFromField(this, $('#' + $(this).data('for')));
    });
    $("#training_duration-slider").bind( "slidechange", function(event, ui){
        var minutes = ui.value;
        $("#training_duration").val(minutes);
        $("#training_duration-display").html(minutes);
    });
    $("#training_default_points-slider").bind( "slidechange", function(event, ui){
        var points = ui.value;
        $("#training_default_points").val(points);
        $("#training_default_points-display").html(points);
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
    
    input.hide();
}