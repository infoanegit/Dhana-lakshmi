function validate() 
        {
        var f = document.forms["myForm"]["fname"].value;
        var e = document.forms["myForm"]["email"].value;
        const regex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
        var p = document.forms["myForm"]["pwd"].value;
        var c = document.forms["myForm"]["cpwd"].value;
            if (f == "")
            { 
                alert("Name must be filled out");
                return false;
            }
            else if(e == "")
            {
                alert("Email must be filled out");
                return false;
            }
            else if (!regex.test(e))
            {
                alert("Email must be filled out with format");
            }
            else if(p == "")
            {
                alert("Password must be filled out");
                return false;
            }
            else if(c == "")
            {
                alert(" Confirm password must be filled out");
                return false;
            }
        }