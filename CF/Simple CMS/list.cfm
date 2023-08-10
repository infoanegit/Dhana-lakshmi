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
            
        <cfif structKeyExists(url,"id")>
            <cfset userdata = data.deletedata(id=url.id)>
            <cflocation url="list.cfm" addtoken="false">
        </cfif>

        <center>
            <h1 align="center"> <b>USER-DATA</b> </h1>
            <table class="table table-bordered w-50 text-center mt-3">
                <div class="mt-5">
                    <a href="list.cfm?logout=true" name="userdata" class="btn btn-dark ">
                        <span class="glyphicon glyphicon-log-out"></span> Log out
                    </a>
                </div>
                <Cfif structKeyExists(URL,'logout') AND URL.logout EQ true>
                    <cfset structClear(session)>
                    <cflocation url="index.cfm">
                </Cfif>
                <thead class="table-primary">
                    <tr>
                        <th>Pagename</th>
                        <th>Description</th>
                        <cfif session.userrole EQ 'admin' OR session.userrole EQ 'editor'>
                        <th>Action</th>
                        </cfif>
                    </tr>
                </thead>
                <tbody>
                    <cfloop query="#userdata#">
                        <tr>
                            <td>#userdata.pagename#</td>
                            <td>#userdata.description#</td>
                            <cfif structKeyExists(session, 'userrole') AND session.userrole EQ 'admin'>
                                <td><a class="btn btn-info" name="userdata" href="newpagelogin.cfm?id=#userdata.Id#" role="button">EDIT</a>
                                    <a class="btn btn-danger" name="userdata" href="list.cfm?id=#userdata.Id#" role="button">DELETE</a></td>
                            </cfif>
                            <cfif structKeyExists(session, 'userrole') AND session.userrole EQ 'editor'>
                                <td><a class="btn btn-info" name="userdata" href="newpagelogin.cfm?id=#userdata.Id#" role="button">EDIT</a></td>
                            </cfif>
                        </tr>
                    </cfloop>
                </tbody>
            </table>
            <div class="mt-5">
                <cfif session.userrole EQ 'admin' OR session.userrole EQ 'editor'>
                    <a class="btn btn-dark" name="userdata" href="newpagelogin.cfm" role="button">Add New</a>
                </cfif>
            </div>
        </center>
    </body>
</html>

</cfoutput>