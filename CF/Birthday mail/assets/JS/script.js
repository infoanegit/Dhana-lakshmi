$(function(){
    $('form').submit(function(){
        var bbname = $('#bbname').val();
        var email = $('#email').val();
        const regex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
        var wishes = $('#wishes').val();
        var image = $('#image').val();

        if(bbname == '') {
            alert("B'day Baby name must be fill out");
            return false;
        }
        else if (!regex.test(email)){
            alert("Email must be filled out with format");
        }
        else if(wishes == '') {
            alert("B'day wishes must be fill out");
            return false;
        }
        else if(image == ''){
            alert("plz Upload Greeting Image!!");
            return false;
        }
        else{
            alert("Mail sended successfully");
            return true;
        }
    });
});
