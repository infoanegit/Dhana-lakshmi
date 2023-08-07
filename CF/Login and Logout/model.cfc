<cfcomponent>
    <cffunction name="insertData" access="public" returntype="void">
        <cfargument name="uname"     type="string"  required="true">
        <cfargument name="password"  type="string"  required="true">
        <cfquery name="insertdata" datasource="dhana_dsn">
            insert into userlogin(Username,Password) 
            values(
                <cfqueryparam value="#arguments.uname#"  cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.password#"  cfsqltype="cf_sql_varchar">
                )
        </cfquery>
    </cffunction>

    <cffunction name="checklogin" access="public" returntype="query">
        <cfargument name="Username" type="string" required="false" default="">
        <cfargument name="Password" type="string" required="false" default="">
        <cfquery name="checklogin" datasource="dhana_dsn">
            select Username, Password
            from userlogin 
            where Username = <cfqueryparam value="#arguments.Username#" cfsqltype="cf_sql_varchar">
            and Password = <cfqueryparam value="#arguments.Password#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn checklogin>
    </cffunction>

    <cffunction name="getdata" access="public" returntype="query">
        <cfquery name="userlogin" datasource="dhana_dsn">
            select * from userlogin
        </cfquery>
        <cfreturn userlogin.recordcount>
    </cffunction>

</cfcomponent>