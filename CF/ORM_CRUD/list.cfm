<cfoutput>
    <!DOCTYPE HTML>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="./assets/CSS/bs.css">
        </head>
        <body>

            <cfset page = EntityLoad("employee")>
            <cfif structKeyExists(url,'id')>
                <cfset deletedata = entityLoadByPk("employee",url.id)>
                <cfset entitydelete(deletedata)>
                <cflocation url="list.cfm">
            </cfif>
            
            <h1 align="center"> <b>USER-DATA</b> </h1>
            <center>
                <table class="table table-bordered w-50 text-center">
                    <thead class="table-primary">
                        <tr>
                            <th>Employee name</th>
                            <th>Employee age</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop array="#page#" index="page">
                            <cfoutput>
                                <tr>
                                    <td>#page.getname()#</td>
                                    <td>#page.getage()#</td>
                                    <td>
                                        <a class="btn btn-info" name="page" href="edit.cfm?id=#page.getid()#" role="button">Edit</a>
                                        <a class="btn btn-danger" name="page" href="list.cfm?id=#page.getid()#" role="button">Delete</a>
                                    </td>
                                </tr>
                            </cfoutput>
                        </cfloop>
                    </tbody>
                </table>
                <a class="btn btn-dark" name="page" href="index.cfm" role="button" >Add</a>
            </center>
        </body>
    </html>
</cfoutput>