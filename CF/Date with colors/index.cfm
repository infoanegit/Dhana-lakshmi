<cfoutput>
    <!DOCTYPE HTML>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="./assets/CSS/bs.css">
            <style>
                .myDIV 
                {
                    width: 700px;
                    height: 450px;
                    background-color: rgb(161, 196, 225);
                    display:flex;
                    flex-direction: column;
                }
            </style>
        </head>
        <body>
            <div class="container myDIV ">
                <center>
                    <h2>Date and Time Functions</h2>
                    <cfset currentdate= Now()>
                    <!--- Last wednesday date --->
                    <cfset obj= {}>
                    <cfset todaydayOfWeek = dayOfWeek(currentdate)>
                    <cfset wednesdayOffset = (4-todaydayOfWeek)>
                    <cfset obj.mostRecentWednesday = dateAdd("d", wednesdayOffset, currentdate)>
                    <!--- Last day in month --->
                    <cfset StartDate = createDate(year(now()), month(now()), 1 )>
                    <cfset EndDate = dateAdd('d', -1, dateAdd('m', 1, StartDate ))>
                    
                    <cfoutput>Today's Date #DateFormat(Now(),"dd-mm-yy")#</cfoutput> <br>
                    <cfoutput>Current month in numeric- #month(currentdate)#</cfoutput> <br>
                    <cfoutput>Current month in words- #monthAsString(month(currentdate))#</cfoutput> <br>
                    <cfoutput>Last Wednesday Date- #DateFormat(obj.mostRecentWednesday, "dd-mm-yy")#</cfoutput> <br>
                    <cfoutput>Last day in month- #DateFormat(EndDate,"dddd")#</cfoutput> <br><br>

                    <!--- Last Five days from currentdate --->
                    <h4>Last fivedays from currentdate</h4>
                    <cfloop index="intOffset" from="1" to="5" step="1">
                        <cfset dtDay = DateAdd( "d", -intOffset, currentdate )>
                        <cfset daystring = dateFormat(dtDay,"dddd")>
                        <!--- Last 5 days output should be in corresponding colors --->
                        <cfif daystring eq "Sunday">
                            <cfset test="color:red;">
                        <cfelseif daystring eq "Monday">
                            <cfset test="color:green;">
                        <cfelseif daystring eq "Tuesday">
                            <cfset test="color:orange;">
                        <cfelseif daystring eq "Wednesday">
                            <cfset test="color:yellow;">
                        <cfelseif daystring eq "Thursday">
                            <cfset test="color:black;font-weight: bold;">
                        <cfelseif daystring eq "Friday">
                            <cfset test="color:blue;">
                        <cfelseif daystring eq "Saturday">
                            <cfset test="color:red;font-weight: bold;">
                        </cfif>
                        <span class="color" style="#test#"> #DateFormat( dtDay, "dd-mmm-yyyy" )# - #dateFormat(dtDay,"dddd")# </span> <br>
                    </cfloop>
                </center>
            </div>
        </body>
    </html>
</cfoutput>



