<cfcomponent>
    
    <cfset this.name="test1221"> 
    <cfset this.sessionmanagement="true">
    <cffunction name="onApplicationStart">
        <script>
            alert("onApplicationStart");
        </script>
    </cffunction>
    <cffunction name="OnRequestStart" access="public" returntype="void" output="false">
        <cfif NOT isdefined("session.Username") AND listlast (cgi.SCRIPT_NAME,"/") EQ "welcome.cfm"> 
            <cflocation url="index.cfm" addtoken="false">
        <cfelseif isdefined("session.Username") AND listlast (cgi.SCRIPT_NAME,"/") EQ "index.cfm">
            <cflocation url="welcome.cfm" addtoken="false"> 
        <cfelseif isdefined("session.Username") AND listlast (cgi.SCRIPT_NAME,"/") EQ "sign up.cfm" >  
            <cflocation url="welcome.cfm" addtoken="false">
        </cfif>
    </cffunction>
    <cffunction name="onSessionStart">
        <script>
            alert("onSessionStart");
        </script>
    </cffunction> 
    <cffunction name="onSessionEnd">
        <script>
            alert("onSessionEnd");
        </script>
    </cffunction> 
    <cffunction name="OnRequestEnd">
        <script>
            alert("OnRequestEnd");
        </script>
    </cffunction> 
</cfcomponent>
