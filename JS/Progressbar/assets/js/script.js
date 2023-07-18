function move(animation) {
    var width = $("#move").html().split("%")[0];
        if (animation == 'plus' && parseInt(width) != 100) {
            $("#move").html(`${parseInt(width) + 10}%`);
            $("#move").css("width", `${parseInt(width) + 10}%`);
        }
        else if (animation == 'minus' && parseInt(width) != 0) {
            $("#move").html(`${parseInt(width) - 10}%`);
            $("#move").css("width", `${parseInt(width) - 10}%`);
        }
}