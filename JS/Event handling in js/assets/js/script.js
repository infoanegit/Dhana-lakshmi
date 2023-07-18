$(document).ready(function(){  
    $('#mouse').mousedown(function(event) {
    switch(event.which) {
        case 1:
            alert('Left Mouse button clicked.');
            break;
        case 2:
            alert('scroll Mouse button clicked.');
            break;
        case 3:
            alert('Right Mouse button clicked.');
            break;
            }
    });
});