<cfcomponent>
    <cffunction name="insertdata" access="public" returntype="void">
        <cfargument name="pagename" type="string" required="true">
        <cfargument name="description" type="string" required="true">
        <cfquery name="insertdata" datasource="dhana_dsn">
        insert into newpage(pagename,description)
        values(
            <cfqueryparam value="#arguments.pagename#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">
        )
        </cfquery>
    </cffunction>

    <cffunction name="displaydata" access="public" returntype="query">
        <cfargument name="id" type="string" required="false" default="">
        <cfquery name="newpage" datasource="dhana_dsn">
            select * from newpage
            <cfif len(arguments.id)>
                where id =<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_varchar" >
            </cfif>
        </cfquery>
        <cfreturn newpage>
    </cffunction>

    <cffunction name="updatedata" access="public" returntype="void">
        <cfargument name="id" type="string" required="true" >
        <cfargument name="pagename" type="string" required="true" >
        <cfargument name="description" type="string" required="true" >
        <cfquery name="newpage" datasource="dhana_dsn">
            update newpage set
            pagename = <cfqueryparam  value="#arguments.pagename#"  cfsqltype="cf_sql_varchar">,
            description = <cfqueryparam   value="#arguments.description#"  cfsqltype="cf_sql_varchar">
                where id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_varchar">
        </cfquery>
    </cffunction>

    <cffunction name="deletedata" access="public" returntype="void">
        <cfargument name="id" type="string" required="false" default="">
        <cfquery name="newpage" datasource="dhana_dsn">
               delete from newpage where id =<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_varchar" >
        </cfquery>
    </cffunction>

    <cffunction name="checklogin" access="public" returntype="query">
        <cfargument name="username" type="string" required="false" default="">
        <cfargument name="userrole" type="string" required="false" default="">
        <cfquery name="checklogin" datasource="dhana_dsn">
            select username, userrole
            from login
            where username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
            and userrole = <cfqueryparam value="#arguments.userrole#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn checklogin>
    </cffunction>

    <cffunction name="getdata" access="public" returntype="query">
        <cfargument name="id" type="string" required="false" default="">
        <cfquery name="newpage" datasource="dhana_dsn">
            select * from newpage
            <cfif len(arguments.id)>
                where id =<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_varchar" >
            </cfif>
        </cfquery>
        <cfreturn newpage>
    </cffunction>
</cfcomponent>