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
                    background-color: rgb(82, 150, 118);
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
            <cfset data=createObject('component','model') >
            <cfif structKeyExists(form,'submit')>
                <cfset userresult=data.insertData(uname=form.uname,password=form.password) >
                <cflocation url="index.cfm" addtoken="false">
            </cfif>

            <div class="container sborder from-group">
                <div class="container myDIV ">
                    <h1 align="center"><b>SIGN UP</b></h1>
                    <form method="post" name="signinform">
                        <div class="col mt-5">
                            <center>
                                <div class="col-lg-9">
                                    <label for="uname" class="label"><h3>USERNAME</h3></label>
                                    <input type="text" class="form-control" id="uname" name="uname" placeholder="Enter your name" required>
                                </div>
                                <div class="col-lg-9 mt-3">
                                    <label for="password" class="label"><h3>PASSWORD</h3></label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                                </div>
                                <div class="mt-5">
                                    <input type="submit" name="submit" class="btn btn-dark" value="Sign in">
                                </div>
                            </center>
                        </div>
                    </form>
                </div>
            </div>
        </body>
    </html>
</cfoutput>