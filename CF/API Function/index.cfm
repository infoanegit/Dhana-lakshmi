<cfoutput>
    <!DOCTYPE HTML>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
            <link rel="stylesheet" href="./assets/CSS/bs.css">
            <script src="./assets/JS/script.js"></script>
            <style>
                .mydiv{
                    width: 300px;
                    height: 200px;
                    background-color: rgb(161, 196, 225);
                    display:flex;
                    flex-direction: column;
                }
                .ip{
                    border-radius: 25px;
                    border: 1px solid rgb(0, 0, 0); 
                }
            </style>
        </head>
        
        <body>
            <div class="container mydiv mt-5">
                <h2 align="center">API Function</h2>
                <form id="form" method="post" name="form">
                    <center>
                        <div class="col">
                            <div class="col-lg-9 mt-3">
                                <label>Enter your IP address</label>
                                <input type="text" class="ip" name="ip">
                            </div>
                            <div class="mt-3" align="center">
                                <input class="btn btn-dark btn-sm" type="submit" value="Submit">
                            </div>
                        </div>
                    </center>
                </form>
            </div>

            <!--- Make API call --->
            <cfif structKeyExists(form,"ip")>
                <cfhttp result="result" method="get" url="http://api.ipstack.com/#form.ip#?access_key=119d1c6f7fa6e4d7d708d3a8c6d90913">
                </cfhttp>
                
                <cfset record = deserializeJSON(result.Filecontent)>
                <cfset record2 = "#record.location#">
                <center>
                    <table class="table table-bordered w-50 text-center mt-3">
                        <thead class="table-primary" >
                            <tr>
                                <th>List of ip</th>
                                <th>values</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfloop collection="#record#" item="value" >
                                <cfif value NEQ "location">
                                    <tr class="table-secondary">
                                        <td>#value#</td>
                                        <td>#record[value]#</td>
                                    </tr>
                                <cfelseif value NEQ "languages">
                                    <cfloop collection="#record.location#" item="value1">
                                        <cfif value1 NEQ "languages">
                                            <tr class="table-secondary">
                                                <td>#value1#</td>
                                                <td>#record.location[value1]#</td>
                                            </tr>
                                        <!--- <cfelse>
                                            <cfloop array="#record.location[value1]#" index="value2">
                                                <cfdump var="#value2#"/>
                                                <cfset list="">
                                                <cfset listAppend = listAppend(list,value2.name) >
                                                    <tr class="table-secondary">
                                                        <td>#listAppend#</td>
                                                    </tr>
                                            </cfloop> --->
                                        </cfif>
                                    </cfloop>
                                </cfif>
                            </cfloop>
                        </tbody>
                    </table>
                </center>
            </cfif>
        </body>
    </html>
</cfoutput>