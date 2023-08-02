<cfloop from="1" to="3" index="i"></br>
    <cfloop from="#i#" to="9" index ="j" step="3">
    <cfoutput>#j#</cfoutput>
    </cfloop>
    </cfloop>

<cfscript>
    for(i=1; i<=3; i++){
        for(i=j; j<=9; j=j+3){
            writeOutput(j);
        }
    }
</cfscript>