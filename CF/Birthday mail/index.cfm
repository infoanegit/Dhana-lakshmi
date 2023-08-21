<cfoutput>
    <!DOCTYPE HTML>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
            <script src="./assets/JS/script.js"></script>
            <link rel="stylesheet" href="./assets/CSS/bs.css">
            <link rel="stylesheet" href="./assets/CSS/style.css">
            <style>
                .bg{
                    background-image: url('./assets/IMAGES/bgbirthday.jpg');
                    background-repeat: no-repeat;
                    background-position: center center;
                }    
            </style>
        </head>
        <body class="bg">

            <cfif(!directoryExists("#expandPath("./assets/images2")#"))>
                <cfset directoryCreate("#expandPath("./assets/images2")#")>
            </cfif>

            <cfif structKeyExists(form,'submit')>
            <cffile action="upload" destination="#expandPath("./assets/images2")#" result="choosefile" filefield="form.image" nameconflict="overwrite">
                <cfmail to="#form.email#" from="dvaratharajan@infoane.com" subject="Happiee Bornday #bbname#" server="localhost">
                    <cfimage action="writeToBrowser" source="#expandPath("./assets/images2/#choosefile.serverfile#")#" height="200" width="200">
                </cfmail>
            </cfif>
            
            <!--- form container  --->
            <div class="container">
                <div class="form">
                    <h2 align="center">SEND BIRTHDAY MAIL</h2>
                    <form id="form" method="post" name="myform" enctype="multipart/form-data">
                        <div class="col">
                            <div class="col-lg-9 mt-3">
                                <label for="bbname" class="label"><h5>Birthday Baby Name</h5></label>
                                <input type="text" class="form-control" id="bbname" name="bbname" placeholder="Birthday Baby Name" style="width: 300px;">
                            </div>
                            <div class="col-lg-9 mt-3">
                                <label for="email" class="label"><h5>His/Her Email Id</h5></label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="His/Her Email Id" style="width: 300px;">
                            </div>
                            <div class="col-lg-9 mt-3">
                                <label for="wishes" class="label"><h5>Birthday Wishes</h5></label>
                                <input type="text area" class="form-control" id="wishes" name="wishes" placeholder="Birthday Wishes" style="width: 300px;">
                            </div>
                            <div class="col-lg-9 mt-3">
                                <label for="greeting image" class="label"><h5>Greeting Image</h5></label>
                                <input type="file" class="form-control" id="image" name="image" style="width: 300px;">
                                
                            </div>
                            <div class="mt-2" align="center">
                                <input type="submit" class="btn" id="submit" name="submit" value="Send">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </body>
    </html>
</cfoutput>
