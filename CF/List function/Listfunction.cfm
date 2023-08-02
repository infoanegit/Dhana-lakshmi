<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        </head>
        <body>
            <div class="container mt-5">
                <form id="form" name="myForm" method="post">
                    <div class="container mx-auto  text-center p-3 w-75">
                        <div class="row w-50 mx-auto">
                            <label for="numbers"><h4> Enter your numbers</h4></label>
                            <input type="text" id="numbers" name="checkOddEven" class="form-control text-center form-control-sm">
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
        <cfset myList = ""> 
            <cfloop index="result" list="#form.CHECKODDEVEN#"> 
                <cfif result mod 3 EQ 0>
                    <cfset myList = listAppend(myList,result)>
                </cfif>  
            </cfloop> 
        <p id="display" class="text-light text-center mx-auto bg-primary w-25">#myList#</p>
    </cfif>
</cfoutput>

<script>
    $("form").on('submit', function() {
        var numbers=$("#numbers").val();
        
        if(numbers==""){
            alert("Please enter your numbers");
            return false;
        }
        else if (/^([0-9]*)+([0-9]+)+$/.test(numbers)){
			alert("Only numeric value allowed");
			return false;
		}
        else if((isNaN(numbers)) && !(numbers.includes(","))){
			alert("Only numeric value allowed");
			return false;
		}
        else {
            $("#display").val(myList);
            return false;
        }
    });
    
</script>

