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
    });
    $("#minutes").change();    
});