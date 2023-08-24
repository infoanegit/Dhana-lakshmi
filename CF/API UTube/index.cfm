<cfoutput>
<cfset APIkey = "AIzaSyDtK3sdgkyXYP_E3pC-u8hduxXfhys0TTE">
<cfset channelID = "UCV4JZdixxw1GOW9r0Sqp1nw">

<cfhttp method="get" url="https://www.googleapis.com/youtube/v3/search?key=#APIkey#&channelId=#channelID#" result="result">
</cfhttp>
    <cfset utubedata = deserializeJSON(result.filecontent)>
    <!--- <cfdump var="#result#" /> --->
    <!--- <cfdump var="#utubedata#"/> --->
    <cfloop array="#utubedata['items']#" index="key">
        <cfset videoid ="">
        <!--- <cfdump var="#key#" /> --->
        <cfif structKeyExists(key["id"],"videoid")>
            <cfset videoid=key["id"].videoid>
        </cfif>
        <cfif len(videoid)>
            <iframe width="600" height="550" src="https://www.youtube.com/embed/#videoid#" title="youtube video" frameborder="0" ></iframe>
        </cfif>
    </cfloop>
</cfoutput>