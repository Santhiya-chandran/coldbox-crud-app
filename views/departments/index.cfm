<cfoutput>
	<a href="/departments/new" class="btn btn-primary mb-2">New Department</a>

	<table class="table table-bordered">
		<tr>
			<th>Name</th>
			<th>Abbr</th>
			<th>Actions</th>
		</tr>
		<cfloop query="#prc.depts#">
		<tr>
			<td>#department_name#</td>
			<td>#department_abbreviation#</td>
			<td>
				<a href="/departments/edit/#department_id#">Edit</a> |
				<a href="/departments/delete/#department_id#">Delete</a>
			</td>
		</tr>
		</cfloop>
	</table>

</cfoutput>