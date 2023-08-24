
<cfset authSID = "ACc5504ab1b4a9db137fa7c29433cef661">
<cfset authTOKEN = "bca0fd9e99a0a2d1eb421eea8bef830e">
<cfset message = "Hiiiii Dhan">

    <cfhttp method="post" url="https://api.twilio.com/2010-04-01/Accounts/#authSID#/Messages.json"  result="result">
        <cfhttpparam name="Authorization" type="header" value="Basic #ToBase64(authSID & ':' & authTOKEN)#" >
        <cfhttpparam name="From" type="formfield" value="whatsapp:+14155238886">
        <cfhttpparam name="To" type="formfield" value="whatsapp:+919080017386">
        <cfhttpparam name="Body" type="formfield" value="#message#">
    </cfhttp>