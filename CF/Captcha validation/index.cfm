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
            <style>
                .myDIV 
                {
                    width: 700px;
                    height: 450px;
                    background-color: rgb(161, 203, 225);
                    display:flex;
                    flex-direction: column;
                }
            </style>
        </head>
        <body>
            <!--- Create captcha --->
            <cfset randomcaptcha = createUUID()>
            <cfset newcaptcha = listfirst(randomcaptcha,'-')>

            <!--- Form container --->
            <div class="container myDIV">
                <h2 align="center">CAPTCHA VALIDATION</h2>
                <form method="post" id="form" name="form">
                    <input type ="hidden" name ="checkcaptcha" value ='#newcaptcha#'>
                    <center>
                        <div class=" w-25 mt-3">
                            <label for="captcha" class="label"><h5>Captcha</h5></label>
                            <input type="text" class="form-control" id="captcha2" name="captchavalue">
                        </div>
                        <div class="w-25 mt-3 col align-items-center">
                            <cfimage action="captcha" width="200" height="50" text="#newcaptcha#" difficulty="medium" fontSize="18" fonts="Comic Sans MS,Times New Roman">
                        </div>
                        <div class=" w-25 mt-3">
                            <label for="email" class="label"><h5>Email</h5></label>
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                        <div class="mt-3">
                            <input type="submit" class="submit btn btn-dark" name="submit" value="submit">
                        </div>
                    </center>
                </form>
            </div>

            <!--- Form submition --->
            <cfif structKeyExists(form,'submit')>
                <cfset captcha= form.captchavalue>
                <cfset newcaptcha= form.checkcaptcha>
                <cfif captcha EQ newcaptcha>
                    <cfoutput>
                        <h3 style="color:SeaGreen; font-style:italic; font-size:small; text-align:center; margin-top:20px;">
                            #form.email# Successfully subscribe our newsletter
                        </h3>
                    </cfoutput>
                <cfelse>
                    <cfoutput>
                        <h3 style="color:red; font-style:italic; font-size:small; text-align:center; margin-top:20px;">Invalid Captcha</h3>
                    </cfoutput>
                </cfif>
            </cfif>
        </body>
    </html>
</cfoutput>