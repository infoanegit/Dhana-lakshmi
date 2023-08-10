<cfcomponent>
    <cfset this.name="tes41t">
    <cfset this.sessionmanagement="true">
    <cffunction name="OnRequestStart" access="public" returntype="void" output="false">
        <cfif NOT isdefined("session.username") AND listlast (cgi.SCRIPT_NAME,"/") EQ "list.cfm"> 
            <cflocation url="index.cfm" addtoken="false">
        </cfif>
    </cffunction>
</cfcomponent>