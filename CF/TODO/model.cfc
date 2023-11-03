<cfcomponent>
    <cffunction name="insertData" access="remote">
        <cfargument name="notes"  type="string"  required="true">
        <cfquery name="insertdata" datasource="dhana_dsn">
            insert into todo (notes,isactive,created_date)
            values(
                <cfqueryparam value="#arguments.notes#"  cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="1"  cfsqltype="cf_sql_bit">,
                <cfqueryparam value="#now()#"  cfsqltype="cf_sql_timestamp">
                )
        </cfquery>
    </cffunction>


    <cffunction name="getData" access="remote" returnformat="json">
        <cfargument name="notes"  type="string"  required="false">,
        <cfargument name="isactive" type="boolean" required="false">,
        <cfargument name="created_date"  type="Date"  required="false">

        <cfquery name="getdata" datasource="dhana_dsn">
            select * from todo
            where 1 = 1
            <cfif structKeyExists(arguments,"isactive")>
                AND isactive = <cfqueryparam value="#arguments.isactive#"  cfsqltype="cf_sql_bit">
            </cfif>
        </cfquery>
        <cfset data = QueryToArray(getdata)>
        <cfreturn data>
    </cffunction>


    <cffunction name="getActiveCount" access="remote" returnformat="json">
        <cfargument name="isactive"  type="boolean"  required="false">

        <cfquery name="getActiveCount" datasource="dhana_dsn">
            select * from todo
            where 1 = 1
            AND isactive = 1
        </cfquery>
        <cfset data = QueryToArray(getActiveCount)>
        <cfreturn data>
    </cffunction>


    <cffunction name="QueryToArray" access="public" returntype="array" output="false" hint="This turns a query into an array of structures.">
        <!--- Define arguments. --->
        <cfargument name="Data" type="query" required="yes" />
        <cfscript>
            // Define the local scope.
            var LOCAL = StructNew();
            // Get the column names as an array.
            LOCAL.Columns = ListToArray( ARGUMENTS.Data.ColumnList );
            // Create an array that will hold the query equivalent.
            LOCAL.QueryArray = ArrayNew( 1 );
            // Loop over the query.
            for (LOCAL.RowIndex = 1 ; LOCAL.RowIndex LTE ARGUMENTS.Data.RecordCount ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){
                // Create a row structure.
                LOCAL.Row = StructNew();
                // Loop over the columns in this row.
                for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE ArrayLen( LOCAL.Columns ) ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){
                    // Get a reference to the query column.
                    LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];
                    // Store the query cell value into the struct by key.
                    LOCAL.Row[ LOCAL.ColumnName ] = ARGUMENTS.Data[ LOCAL.ColumnName ][ LOCAL.RowIndex ];
                }
                // Add the structure to the query array.
                ArrayAppend( LOCAL.QueryArray, LOCAL.Row );
            }
            // Return the array equivalent.
            return( LOCAL.QueryArray );
        </cfscript>
    </cffunction>


    <cffunction name="updateData" access="remote" returntype="void">
        <cfargument name="id"  type="numeric"  required="true">
        <cfargument name="isactive"  type="boolean"  required="false">
        <cfargument name="notes"  type="string"  required="false" default="">
        <cfquery name="updateData" datasource="dhana_dsn">
            <cfif structKeyExists (arguments,"isactive")>
                update todo set
                isactive = <cfqueryparam value = "#arguments.isactive#" cfsqltype="cf_sql_bit">,
                updated_date = <cfqueryparam value = "#now()#" cfsqltype="cf_sql_timestamp">
                where id = <cfqueryparam value = "#arguments.id#" cfsqltype="cf_sql_integer">
            <cfelseif structKeyExists(arguments,"notes")>
                update todo set
                notes = <cfqueryparam value = "#arguments.notes#" cfsqltype="cf_sql_varchar">,
                updated_date = <cfqueryparam value = "#now()#" cfsqltype="cf_sql_timestamp">
                where id = <cfqueryparam value = "#arguments.id#" cfsqltype="cf_sql_integer">
            </cfif>
        </cfquery>
    </cffunction>


    <cffunction name="deleteData" access="remote" returntype="void">
        <cfargument name="id"  type="string"  required="false">

        <cfquery name="getIsActive" datasource="dhana_dsn">
            select * from todo
            where isactive = 0
        </cfquery>

        <cfset var ="#getIsActive#">
        <cfif getIsActive.RecordCount>
            <cfset findIsActive = valueList(getIsActive.id)>

            <cfquery name="deleteData" datasource="dhana_dsn" >
                delete from todo
                where id in(<cfqueryparam value = "#findIsActive#" cfsqltype = "cf_sql_integer" list="true">)
            </cfquery>
        </cfif>
    </cffunction>


    <cffunction name="deleteNotes" access="remote" returntype="void">
        <cfargument name="id"  type="numeric"  required="true">

        <cfquery name="deleteNotes" datasource="dhana_dsn">
            delete from todo
            where id = (<cfqueryparam value = "#arguments.id#" cfsqltype = "cf_sql_integer" >)
        </cfquery>
    </cffunction>


    <cffunction name="deleteNotes2" access="remote" returntype="void">
        <cfquery name="checkIsActive" datasource="dhana_dsn">
            select * from todo where isactive !=1
        </cfquery>
        <cfif checkIsActive.RecordCount>
            <cfset deActiveIds = valueList(checkIsActive.id)>
            <cfquery name="deleteNotactive" dbtype="query">
                delete from todo
                where id IN (<cfqueryparam value = "#deActiveIds#" cfsqltype = "cf_sql_integer" list="true">)
            </cfquery>
        </cfif>
    </cffunction>
</cfcomponent>