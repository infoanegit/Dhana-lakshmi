<cfcomponent>
    <cffunction name="insertData" access="public" returntype="void">
        <cfargument name="fname"  type="string"  required="true">
        <cfargument name="lname"  type="string"  required="true">
        <cfargument name="email"  type="string"  required="true">
        <cfargument name="age"    type="integer" required="true">
        <cfargument name="gender" type="string"  required="true" default="">
        <cfquery name="insertdata" datasource="dhana_dsn">
            insert into student(Firstname,Lastname,Email,Age,Gender) 
            values(
                <cfqueryparam value="#arguments.fname#"  cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.lname#"  cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.email#"  cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.age#"    cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">
                )
        </cfquery>
    </cffunction>

    <cffunction name="displaydata" access="public" returntype="query">
        <cfargument name="id" type="string" required="false" default="">
        <cfquery name="studenttable" datasource="dhana_dsn">
            select * from student
            <cfif len(arguments.id)>
                where id =<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_varchar" >
            </cfif>
        </cfquery>
        <cfreturn studenttable>
    </cffunction>

    <cffunction name="updatedata" access="public" returntype="void">
        <cfargument name="id" type="string" required="true" >
        <cfargument name="fname" type="string" required="true" >
        <cfargument name="lname" type="string" required="true" >
        <cfargument name="email" type="string" required="true" >
        <cfargument name="age" type="string" required="true" >
        <cfargument name="gender" type="string" required="true" >
        <cfquery name="studenttable" datasource="dhana_dsn">
            update student set
            Firstname=<cfqueryparam  value="#arguments.fname#"  cfsqltype="cf_sql_varchar">,
            Lastname=<cfqueryparam   value="#arguments.lname#"  cfsqltype="cf_sql_varchar">,
            Email=<cfqueryparam      value="#arguments.email#"  cfsqltype="cf_sql_varchar">,
            Age=<cfqueryparam        value="#arguments.age#"    cfsqltype="cf_sql_varchar">,
            Gender=<cfqueryparam     value="#arguments.gender#" cfsqltype="cf_sql_varchar">
                where id=<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_varchar">
        </cfquery>
    </cffunction>

    <cffunction name="deletedata" access="public" returntype="void">
        <cfargument name="id" type="string" required="false" default="">
        <cfquery name="studenttable" datasource="dhana_dsn">
               delete from student where id =<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" >
        </cfquery>
    </cffunction>

</cfcomponent>