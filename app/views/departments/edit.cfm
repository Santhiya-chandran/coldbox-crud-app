<cfoutput>
<h1>departments/edit view</h1>

<!--- Use shared form partial --->
<cfset formAction = "/departments/update">
<cfset formMethod = "post">
<cfset submitLabel = "Update Department">
<cfset dept = structKeyExists(prc, 'dept') ? prc.dept : {}>
<cfinclude template="department_form.cfm">
</cfoutput>
