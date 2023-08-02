<Cfoutput>
    <!DOCTYPE.html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        </head>
        <style>
            .odd{
             color:green;
            }
            .even{
             color:blue;
            }
         </style>
         
        <body>
            <div class="container mt-5 bg-danger bg-gradient">
                <form id="form" name="myForm" method="post" action="">
                    <div class="container mx-auto text-center p-3 w-75">
                        <center>
                            <h1>ODD/EVEN</h1>
                        </center>
                        <div class="row w-50 mx-auto">
                            <label for="numbers"><h5>Enter any number</h5></label>
                            <input type="text" id="numbers" value="" name="checkOddEven" class="form-control text-center form-control-sm">
                        </div>
                        <div class="p-3 mt-3">
                            <input type="submit" class="sbutton" name="submit" value="submit">
                        </div>
                    </div>
                </form>
            </div>
        </body>
    </html>
    <cfif structKeyExists(form,"submit")>
            <center>
                <div class="text-center w-50 bg-secondary text-white">
                    <p>ODD numbers are in Blue and EVEN numbers are in Green</p>
                </div>
            </center>
            <cfloop index="i" from="1" to="#form.checkOddEven#">
                <cfif i mod 2 is 0>
                   <div class="odd text-center">
                        #i#
                   </div> 
                    <cfelse>
                        <div class="even text-center">
                            #i#
                       </div>        
                </cfif>
            </cfloop>
    </cfif>
</Cfoutput>
  
<script>
    $("form").submit(function () {
        var numbers=$("#numbers").val();

        if(numbers==""){
            alert("Please enter any number");
            return false;
        }else if(/[^0-9]|^0+(?!$)/g.test(numbers)){
			alert("Only numeric value allowed");
			return false;
		}else if(numbers=="0"){
            alert("Enter Non-zero element");
            return false;
        }
    });
</script>

