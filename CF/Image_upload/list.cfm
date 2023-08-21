<cfoutput>
    <!DOCTYPE HTML>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="./assets/css/bs.css">
        </head>
        <body>
            <cfset data = createobject("component","model")>
            <cfset userdata= data.displaydata()>
            <center>
                <h1>IMAGE LIST</h1>
                <table class="table table-bordered w-50 text-center mt-3">
                    <thead class="table-primary">
                        <tr>
                            <th>Image Name</th>
                            <th>Thumbnail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop query="#userdata#">
                            <cfset checkExt = listLast("#userdata.uploadimage#", ".")>
                            <cfif checkExt NEQ "doc">
                                <tr>
                                    <td><a href="details page.cfm?id=#userdata.id#">#userdata.imagename#</a></td>
                                    <td><cfimage action="RESIZE" source="#expandpath("./assets/images2/#userdata.uploadimage#")#" destination="#expandpath("./assets/thumbnail/#userdata.uploadimage#")#" height="20" width="20" overwrite="true">
                                    <img src="./assets/thumbnail/#userdata.uploadimage#"></td>
                                </tr>
                            </cfif>
                        </cfloop>
                    </tbody>
                </table>
            </center>
        </body>
    </html>
</cfoutput>