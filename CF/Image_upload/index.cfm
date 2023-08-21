<cfoutput>
    <!DOCTYPE HTML>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
            <script src="./assets/JS/script.js"></script>
            <link rel="stylesheet" href="./assets/css/bs.css">
            <style>
                .bg {
                    background-image: url('./assets/IMAGES/bgimageupload.jpg');
                    background-repeat: no-repeat;
                    background-position: center center;
                    background-size: 40%;
                    }
            </style>
        </head>
        <body class="bg">

            <cfparam name="imageinfo.imagename" default=""/>
            <cfparam name="imageinfo.description" default=""/>
            <cfparam name="imageinfo.uploadimage" default=""/>

            <cfset data= createobject("component","model")>
            <!--- Form submit --->
            <cfif structKeyExists(form,'submit')>
                <cfif (!directoryExists(expandPath('./assets/images2')))>
                    <cfset directoryCreate('./assets/images2')>
                    <!--- Image upload --->
                    <cffile action="upload" destination="#expandPath("./assets/images2")#" result="choosefile" filefield="form.uploadimage" nameconflict="overwrite">
                    <cfset userdata = data.insertdata(imagename=form.imagename,description=form.description,uploadimage=choosefile.serverfile)>
                <cfelse>
                    <!--- Image upload --->
                    <cffile action="upload" destination="#expandPath("./assets/images2")#" result="choosefile" filefield="form.uploadimage" nameconflict="overwrite">
                    <cfset userdata = data.insertdata(imagename=form.imagename,description=form.description,uploadimage=choosefile.serverfile)>
                </cfif>
            </cfif>

            <div class="container mt-5">
                <form id="form" name="myform" method="post" enctype="multipart/form-data">
                    <h1 align="center">IMAGE UPLOAD</h1>
                    <center>
                        <div class="mt-3">
                            <label for="imagename"><h4>Image Name</h4></label>
                            <input type="text" class="imagename" name="imagename" value="#imageinfo.imagename#" required>
                        </div>
                        <div class="mt-3">
                            <label for="description"><h4>Description</h4></label>
                            <input type="text area" class="description" name="description" value="#imageinfo.description#" required>
                        </div>
                        <div class="mt-3">
                            <label for="upload image"><h4>Upload Image</h4></label>
                            <span id="file_error"></span>
                            <input type="file" id="picture" class="uploadimage" name="uploadimage" value="#imageinfo.uploadimage#" required>
                        </div>
                        <div class="mt-3">
                            <a href="list.cfm" name="userlist" class="btn btn-dark" role="button">List</a>
                            <input type="submit" id="submit" name="submit" class="btn btn-dark" value="Login">
                        </div>
                    </center>
                </form>
            </div>
        </body>
    </html>
</cfoutput>