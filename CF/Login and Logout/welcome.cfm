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
                    background-color: rgb(150, 82, 104);
                    display:flex;
                    flex-direction: column;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <div class="container myDIV ">
                   <h1 align="center">WELCOME!</h1> 
                   <div class="mt-3">
                    <h3 align="center">Hi... #session.Username#</h3>
                   </div>
                   
                   <center>
                        <div class="mt-5">
                            <a href="welcome.cfm?logout=true" name="userdata" class="btn btn-info btn-lg">
                                <span class="glyphicon glyphicon-log-out"></span> Log out
                            </a>
                        </div>
                   </center>
            
                   <Cfif structKeyExists(URL,'logout') AND URL.logout EQ true>
                    <cfset structClear(session)>
                    <cflocation url="index.cfm">
                </Cfif>
                </div>
            </div>
        </body>
    </html>
</cfoutput>