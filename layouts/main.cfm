
<cfoutput>
	<!DOCTYPE html>
	<html>
	<head>
		<title>Departments</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body class="container mt-4">
	
	<nav class="mb-3">
		<a href="/departments">Departments</a> |
		<a href="/logout">Logout</a>
	</nav>
	
	#renderView()#
	
	</body>
	</html>
</cfoutput>
