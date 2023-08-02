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

        <cfif structKeyExists(form,"submit")>
            <cfif structKeyExists(url,"id")>
                <cfset userdata= data.updatedata()>
                <cflocation url="userlist.cfm" addtoken="false">
            </cfif>
        </cfif>

        <cfif structKeyExists(url,"id")>
            <cfset userdata = data.deletedata(id=url.id)>
            <cflocation url="userlist.cfm" addtoken="false">
        </cfif>
                
        <center>
            <h1 align="center"> <b>USER-DATA</b> </h1>
                <table class="table table-bordered w-50 text-center">
                    <thead class="table-primary">
                        <tr>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop query="#userdata#">
                            <tr>
                                <td>#userdata.Firstname#</td>
                                <td>#userdata.Lastname#</td>
                                <td>#userdata.Email#</td>
                                <td>#userdata.Age#</td>
                                <td>#userdata.Gender#</td>
                                <td><a class="btn btn-info" name="userdata" href="form.cfm?id=#userdata.Id#" role="button">EDIT</a>
                                    <a class="btn btn-danger" name="userdata" href="userlist.cfm?id=#userdata.Id#" role="button">DELETE</a></td>
                            </tr>
                        </cfloop>
                    </tbody>
                </table>
        </center>
    </body>
</html>
</CFOUTPUT>