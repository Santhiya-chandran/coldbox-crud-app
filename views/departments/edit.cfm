<cfoutput>
<h1>departments/edit view</h1>

<form action="/departments/update" method="post">
    <input type="hidden" name="id" value="#prc.dept.department_id#">
    <div class="mb-3">
        <label for="name" class="form-label">Department Name</label>
        <input type="text" class="form-control" id="name" name="name" value="#prc.dept.department_name#" required>
    </div>
    <div class="mb-3">
        <label for="abbr" class="form-label">Department Abbreviation</label>
        <input type="text" class="form-control" id="abbr" name="abbr" value="#prc.dept.department_abbreviation#" required>
    </div>
    <button type="submit" class="btn btn-primary">Update Department</button>
</form>
</cfoutput>
