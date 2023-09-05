<CFOUTPUT>

    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </head>
        <body>

            <cfset data = createobject("component","model")>
            <cfset userdata= data.displaydata()>

            <center>
                <h1 align="center"> <b>USER-DATA</b> </h1>
                    <table class="table table-bordered w-50 text-center">
                        <thead class="table-primary">
                            <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfloop query="#userdata#">
                                <tr>
                                    <td>#userdata.Name#</td>
                                    <td>#userdata.Email#</td>
                                    <td><a class="btn btn-info" name="userdata" href="index.cfm?id=#userdata.Id#" role="button">EDIT</a>
                                        <a class="btn btn-danger" name="userdata" href="userlist.cfm?id=#userdata.Id#" role="button">DELETE</a></td>
                                </tr>
                            </cfloop>
                        </tbody>
                    </table>
            </center>
        </body>
    </html>
    
    </CFOUTPUT>