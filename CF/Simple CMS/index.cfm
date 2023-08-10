<cfoutput>

<!DOCTYPE html>
<html>
    <head lang="en">
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
                    background-color: rgb(187, 99, 99);
                    display:flex;
                    flex-direction: column;
                }
        </style>
    </head>
    <body>
        <div class="container myDIV">
            <h1 align="center">LOGIN</h1>
            <form method="post" name="myform">
                <center>
                    <div class="col mt-5">
                        <div class="col-lg-9">
                            <label for="username" class="label"><h4>Username*</h4></label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Enter your name" required>
                        </div>
                        <div class="col-lg-9 mt-3">
                            <label for="password" class="label"><h4>Password*</h4></label>
                            <input type="password" class="form-control" id="userrole" name="userrole" placeholder="Enter your password" required>
                        </div>
                        <div class="mt-5">
                            <input type="submit" name="submit" class="btn btn-dark" value="Login">
                        </div>
                    </div>
                </center>
            </form>
        </div>
        <div class="fs-5 mt-2 text-danger">
            <center>
                <cfset data=createObject('component','model') >
                <cfif structKeyExists(form,'submit')>
                    <cfset checklogin= data.checklogin(username=form.username,userrole=form.userrole)>

                    <cfif checklogin.recordcount gt 0>
                        <cfset session.username = checklogin.username>
                        <cfset session.userrole = checklogin.userrole>
                        <cflocation url="list.cfm" addtoken="false">
                        <cfelse>
                            <cfoutput>Invalid USERNAME and PASSWORD</cfoutput>
                    </cfif>
                </cfif>
            </center>
        </div>
    </body>
</html>

</cfoutput>