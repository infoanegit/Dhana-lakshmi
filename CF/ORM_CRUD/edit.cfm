<cfoutput>
    <!DOCTYPE HTML>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="./assets/CSS/bs.css">
            <style>
                .bg{
                    background-image: url('./assets/IMAGES/editbg.jpg');
                    background-repeat: no-repeat;
                    background-position: center center;
                }
            </style>
        </head>
        <body class="bg">

            <cfset page = EntityLoadByPK("employee",url.id)>
            <cfif structKeyExists(form,'submit')>
                <cfset page.setname(form.empname)>
                <cfset page.setage(form.empage)>
                <cfset entitySave(page)>
                <cflocation url="list.cfm">
            </cfif>

            <div class="container sborder form-group">
                <div class="container">
                    <h1 align="center" style="color:white;" >CREATE ACCOUNT</h1>
                    <form method="post" name="testform">
                        <center>
                            <div class="mt-3">
                                <div class="form-group w-25 mt-3 ">
                                    <label for="empname" class="label"><h4 style="color:white;" >Employee name</h4></label>
                                    <input type="text" class="form-control" id="empname" name="empname" value="#page.getname()#" placeholder="enter your name">
                                </div>
                                <div class="form-group w-25 mt-3">
                                    <label for="empage" class="label"><h4 style="color:white;" >Employee age</h4></label>
                                    <input type="text" class="form-control" id="empage" name="empage" value="#page.getage()#" placeholder="enter your age">
                                </div>
                                <div>
                                    <input type="hidden" name="pageID" value="#page.getid()#">
                                </div>
                                <div class="mt-3" align="center">
                                    <input type="submit" name="submit" class="btn btn-success" value="Update">
                                </div>
                            </div>
                        </center>
                    </form>
                </div>
            </div>
        </body>
    </html>
</cfoutput>