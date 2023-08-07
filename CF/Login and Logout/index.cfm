<cfoutput>
    <!DOCTYPE HTML>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="./assets/css/bs.css">
            <style>
                .myDIV 
                {
                    width: 700px;
                    height: 450px;
                    background-color: rgb(210, 232, 253);
                    display:flex;
                    flex-direction: column;
                }
                ::placeholder {
                    font-style: italic;
                    font-size: 1em;
                    color: mintcream;
                    background: rgb(255, 255, 255);
                    padding: 5px;
                    }
            </style>
        </head>
        <body>
           <div class="container sborder from-group">
                <div class="container myDIV ">
                    <h1 align="center"><b>LOGIN IN</b></h1>
                    <form method="post" name="loginform">
                        <div class="col mt-5">
                            <center>
                                <div class="col-lg-9">
                                    <label for="uname" class="label"><h4>USERNAME</h4></label>
                                    <input type="text" class="form-control" id="uname" name="uname" placeholder="Enter your name" required>
                                </div>
                                <div class="col-lg-9 mt-3">
                                    <label for="password" class="label"><h4>PASSWORD</h4></label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                                </div>
                                <div class="mt-5">
                                    <input type="submit" name="submit" class="btn btn-dark" value="Login">
                                </div>
                                <div class="fs-5 mt-2">
                                    <a href="sign up.cfm">New user?/Sign up</a>
                                </div>
                            </center>
                        </div>
                    </form>
                </div>
            </div>
            <div class="fs-5 mt-2 text-danger">
                <center>
                    <cfset data=createObject('component','model') >
                    <cfif structKeyExists(form,'submit')>
                        <cfset userlogin= data.checklogin(Username=form.uname,Password=form.password)>

                        <cfif userlogin.recordcount gt 0>
                            <cfset session.Username = userlogin.Username>
                            <cflocation url="welcome.cfm"addtoken="false">
                            <cfelse>
                                <cfoutput>Invalid USERNAME and PASSWORD</cfoutput>
                            </cfif>
                        </cfif>
                </center>
            </div>  
        </body>
    </html>
</cfoutput>