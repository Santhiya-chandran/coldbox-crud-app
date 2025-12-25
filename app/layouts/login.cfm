<cfoutput>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<title>Login</title>
</head>
<body class="container mt-5">
	<main class="row justify-content-center">
		<div class="col-6">
				<cfif structKeyExists( flash, "message" )>
					<div class="alert alert-#flash.message.type#">#flash.message.text#</div>
				</cfif>
				#view()#
		</div>
	</main>
		<!-- validation scripts -->
		<script src="/includes/js/validation.js"></script>
</body>
</html>
</cfoutput>
