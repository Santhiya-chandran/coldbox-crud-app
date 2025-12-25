<cfoutput>
<cfparam name="formAction" default="/departments/create">
<cfparam name="formMethod" default="post">
<cfparam name="submitLabel" default="Create Department">
<cfparam name="dept" default="#structNew()#">

<form action="#formAction#" method="#formMethod#">
    <cfif structKeyExists(dept, "department_id")>
        <input type="hidden" name="id" value="#dept.department_id#">
    </cfif>
    <div class="mb-3">
        <label for="name" class="form-label">Department Name</label>
        <input type="text" class="form-control" id="name" name="name" value="#( structKeyExists(dept,'department_name') ? dept.department_name : "" )#" required>
    </div>
    <div class="mb-3">
        <label for="abbr" class="form-label">Department Abbreviation</label>
        <input type="text" class="form-control" id="abbr" name="abbr" value="#( structKeyExists(dept,'department_abbreviation') ? dept.department_abbreviation : "" )#" required>
    </div>
    <button type="submit" class="btn btn-primary">#submitLabel#</button>
</form>
</cfoutput>
