<cfcomponent>
    <cffunction name="insertdata" access="public" returntype="void">
        <cfargument name="imagename" type="string" required="true">
        <cfargument name="description" type="string" required="true">
        <cfargument name="uploadimage" type="string" required="true">
        <cfquery name="insertdata" datasource="dhana_dsn">
            insert into image(imagename,description,uploadimage)
            values(
                <cfqueryparam value="#arguments.imagename#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.uploadimage#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
    </cffunction>

    <cffunction name="displaydata" access="public" returntype="query">
        <cfargument name="id" type="string" required="false" default="">
        <cfquery name="image" datasource="dhana_dsn">
            select * from image
            <cfif len(arguments.id)>
                where id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_varchar">
            </cfif>
        </cfquery>
        <cfreturn image>
    </cffunction>
</cfcomponent>