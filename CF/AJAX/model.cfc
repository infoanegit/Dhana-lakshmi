<cfcomponent>
    <cffunction name="insertData" access="remote" returntype="void">
        <cfargument name="name"  type="string"  required="true">
        <cfargument name="email"  type="string"  required="true">
        <cfquery name="insertdata" datasource="dhana_dsn">
            insert into  students(Name,Email) 
            values(
                <cfqueryparam value="#arguments.name#"  cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.email#"  cfsqltype="cf_sql_varchar">
                )
        </cfquery>
    </cffunction>

    <cffunction name="displaydata" access="remote" returntype="query">
        <cfargument name="id" type="string" required="false" default="">
        <cfquery name="studentstable" datasource="dhana_dsn">
            select * from students
            <cfif len(arguments.id)>
                where id =<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_varchar">
            </cfif>
        </cfquery>
        <cfreturn studentstable>
    </cffunction>
</cfcomponent>