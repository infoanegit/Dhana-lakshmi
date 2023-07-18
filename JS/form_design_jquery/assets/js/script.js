$(document).ready(function(){
    $('form').on('submit', function() {
    var fName = $('#fname').val();
    var email = $('#email').val();
    var pwd = $('#pwd').val();
    var cpwd = $('#cpwd').val();
        if(fName == '') {
            alert("Firstname must be fill out");
            return false;
        }
        else if(email == '') {
            alert("EMAIL must be fill out");
            return false;
        }
        else if(pwd == '') {
            alert("PASSWORD must be fill out");
            return false;
        }
        else if(cpwd == '') {
            alert("CONFIRM PASSWORD must be fill out");
            return false;
        }
    });
});
