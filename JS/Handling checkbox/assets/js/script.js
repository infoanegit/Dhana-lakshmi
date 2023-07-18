$(document).ready(function(){
    $("#c1").on('click',function(){
        $('.checkbox').prop('checked',true);
    });
    $("#c2").on('click',function(){
        $('.checkbox').prop('checked',false);
    });
    $("#c3").on('click',function(){
        $('.checkbox').each(function(){
            $(this).prop('checked',!$(this).prop('checked'));
        });
    });
});
        