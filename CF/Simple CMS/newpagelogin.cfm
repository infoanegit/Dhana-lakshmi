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
                    background-color: rgb(212, 170, 202);
                    display:flex;
                    flex-direction: column;
                }
        </style>
    </head>
    <body>
        <cfparam name="newpage.pagename" default=""/>
        <cfparam name="newpage.description" default=""/>

        <cfset data = createobject("component","model")>
        <cfif structKeyExists(url,"id")>
            <cfset newpage = data.displaydata(id=url.id)>
        </cfif>
        <cfif structKeyExists(form,"submit")>
            <cfset userdata= data.insertData(pagename=form.pagename,description=form.description)>
            <cflocation url="list.cfm" addtoken="false">
        </cfif>
        <cfif structKeyExists(url,"id") and structKeyExists(form,"update")>
            <cfset userdata= data.updatedata(id=url.id,pagename=form.pagename,description=form.description)>
            <cflocation url="list.cfm" addtoken="false">
        </cfif>

        <div class="container myDIV">
            <h1 align="center">NEW PAGE</h1>
            <form method="post" name="myform2">
                <center>
                    <div class="col mt-5">
                        <div class="col-lg-9">
                            <label for="Pagename" class="label"><h4>Pagename*</h4></label>
                            <input type="text" class="form-control" id="pagename" name="pagename" placeholder="Enter your pagename" value="#newpage.pagename#" required>
                        </div>
                        <div class="col-lg-9 mt-3">
                            <label for="Description" class="label"><h4>Description*</h4></label>
                            <input type="text" class="form-control" id="description" name="description" placeholder="Enter your description" value="#newpage.description#" required>
                        </div>
                        <div class="mt-5">
                            <cfif structKeyExists(url,'id')>
                                <input type="submit" name="update" class="btn btn-dark" value="Edit page">
                            <cfelse>
                                <input type="submit" name="submit" class="btn btn-dark" value="Create page">
                            </cfif>
                        </div>
                    </div>
                </center>
            </form>
        </div>
    </body>
</html>

</cfoutput>

