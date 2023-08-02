<cfoutput>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="./assets/css/bs.css">
        <style>
          .label{
            color:rgb(4, 196, 148);
            font-size: 100%;
            font-weight:600px;
            font-weight:bold;
          }
          .sborder{
            border:33px solid rgb(53,123,141);
            background-color: white;
            padding:10px 15px 10px 15px;
          }

        </style>
    </head>
    <body>
        <cfparam name="studentinfo.Firstname" default=""/>
        <cfparam name="studentinfo.Lastname" default=""/>
        <cfparam name="studentinfo.Email" default=""/>
        <cfparam name="studentinfo.Age" default=""/>
        
        <cfset data = createobject("component","model")>
        <cfif structKeyExists(url,"id")>
            <cfset studentinfo = data.displaydata(id=url.id)>
        </cfif>
        <cfif structKeyExists(form,"submit")>
            <cfif !structKeyExists(form,"optradio")>
                <cfset form.optradio = "">
            </cfif>
            <cfset userdata= data.insertData(fname=form.fname, lname=form.lname, email=form.email, age=form.age, gender=form.optradio)>
            <cflocation url="userlist.cfm" addtoken="false">
        </cfif>
        <cfif structKeyExists(form,"update")>
            <cfif !structKeyExists(form,"optradio")>
                <cfset form.optradio = "">
            </cfif>
            <cfset userdata= data.updatedata(id=url.id,fname=form.fname, lname=form.lname, email=form.email, age=form.age, gender=form.optradio)>
            <cflocation url="userlist.cfm" addtoken="false">
        </cfif>
        
        
        <div class="container sborder form-group">
          <div class="container">
                <h1 align="center"> <b>CREATE ACCOUNT</b> </h1>
                <form method="post" name="testForm">
                    <div class="row mt-5">
                        <div class="form-group col-sm-6">
                            <label for="fname" class="label">First name*</label>
                            <input type="text" class="form-control" id="fname" name="fname" placeholder="enter your first name" 
                            value="#studentinfo.Firstname#" required>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="fname" class="label">Last name</label>
                            <input type="text" class="form-control" id="lname" name="lname" placeholder="enter your last name"
                            value="#studentinfo.Lastname#">
                        </div>
                    </div> 
                    <div class="row mt-3">
                        <div class="form-group col-sm-12">
                            <label for="fname" class="label">Email*</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="enter your email" 
                            value="#studentinfo.Email#" required>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="form-group col-sm-6">
                            <label for="fname" class="label">Age</label>
                            <input type="int" class="form-control" id="age" name="age"
                            value="#studentinfo.Age#">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="fname" class="label">Gender:</label>
                            <div class="row">
                                <div class="form-check col-sm-2">
                                    <input type="radio" class="form-check-input" id="radio1" name="optradio" value="male" <cfif studentinfo.Gender EQ "male">checked</cfif>>
                                    <label class="form-check-label" for="radio1">Male</label>
                                </div>
                                <div class="form-check col-sm-2">
                                    <input type="radio" class="form-check-input" id="radio2" name="optradio" value="female" <cfif studentinfo.Gender EQ "female">checked</cfif>>
                                    <label class="form-check-label" for="radio1">Female</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <cfif structKeyExists(url,"id")>
                        <div align="right">
                            <input type="submit" name="update" class="btn btn-success" value="update">
                        </div>
                    <cfelse>
                        <div align="right">
                            <input type="submit" name="submit" class="btn btn-success" value="create">
                        </div>
                    </cfif>
                </form>
            </div>
        </div>
    </body>
</html>
</cfoutput>