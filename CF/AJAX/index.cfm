<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
            <link rel="stylesheet" href="./assets/CSS/bs.css">
            <style>
              .myDIV
                {
                    width: 600px;
                    height: 350px;
                    background-color: rgb(225, 161, 161);
                    display:flex;
                    flex-direction: column;
                }
            </style>
        </head>
        <body>

            <cfparam name="studentinfo.Name" default=""/>
            <cfparam name="studentinfo.Email" default=""/>

            <div class="container myDIV sborder form-group mt-3">
                    <h1 align="center"> <b>CREATE ACCOUNT</b> </h1>
                    <form method="post" name="testForm" enctype="multipart/form-data">
                        <center>
                            <div class="mt-3">
                                <div class="form-group w-25 mt-3">
                                    <label for="name" class="label"><H4>Name*</H4></label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="enter your name" 
                                    value="#studentinfo.Name#" required>
                                </div>
                                <div class="form-group w-25 mt-3">
                                    <label for="fname" class="label"><H4>Email*</H4></label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="enter your email" 
                                    value="#studentinfo.Email#" required>
                                </div>
                            </div>
                        </center>
                            <div align="center" class= "mt-3">
                                <input type="button" name="submit" id="submit" class="btn btn-dark" value="Create" >
                            </div>
                            <div>
                                <h4 id="display" class="text-info"></h4>
                            </div>
                    </form>     
            </div>
        </body>
    </html>

    <script>
        $(document).ready(function () {
            $("##submit").click(function () {
                var Name= $("##name").val();
                var Email= $("##email").val();
                if($('input[type="text"]').val() == ""){
                    $('##display').text('Plz fill the all details');
                    return false;
                }
                else{
                    $.ajax({
                        type: "POST",
                        url:"model.cfc",
                        data:{
                            method:"insertData",
                            name: Name,
                            email: Email
                        },
                        success:function(obj){
                            {   
                                alert('successfully inserted the data');
                                window.location.href='userlist.cfm'
                            }
                        }
                    });
                }
            });
        });
    </script>

</cfoutput>