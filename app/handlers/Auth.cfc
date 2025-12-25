/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	property name="userService" inject="UserService";

	function login( event ) {
		// If already authenticated redirect to departments
		if ( structKeyExists( session, "user" ) ){
			relocate( "departments" );
			return;
		}
		// Use dedicated login layout
		event.setLayout("login");
		event.setView( "auth/login" );
	}

	function authenticate( event ) {
		var user = userService.authenticate(
			event.getValue( "username" ),
			event.getValue( "password" )
		);
		if ( structIsEmpty( user ) ) {
			flash.message = { type="danger", text="Invalid credentials" };
			// stay on login layout + view
			event.setLayout("login");
			event.setView("auth/login");
			return;
		}

		// Successful authentication: store user and activity timestamp
		session.user = user;
		session.lastActivity = now();
		// build full name fallback to username
		var fullName = session.user.username;
		if ( structKeyExists( session.user, "first_name" ) and len( trim( session.user.first_name ) ) ){
			fullName = trim( session.user.first_name & " " & ( structKeyExists(session.user,"last_name") ? session.user.last_name : "" ) );
		}
		session.user.fullName = fullName;
		flash.message = { type="success", text="Welcome back, " & fullName };
		relocate( "departments" );
	}

	function createAccount( event ) {
		// If username is not present in the request, render the create-account form (GET)
		var rc = getRequestCollection();
		if ( not structKeyExists( rc, "username" ) ){
			event.setLayout("login");
			event.setView("auth/createAccount");
			return;
		}

		// POST: Create a new account with duplicate-checking
		var result = userService.create( rc.username, rc.password );
		if ( result.success ){
			flash.message = { type="success", text="Account created. Please login." };
			relocate( "auth.login" );
			return;
		}

		// show create account form with error
		flash.message = { type="danger", text=result.message };
		event.setLayout("login");
		event.setView("auth/createAccount");
		return;
	}

	function logout( event ) {
		// clear any flash message and the session
		if ( structKeyExists( flash, "message" ) ){
			structDelete( flash, "message" );
		}
		structClear( session );
		relocate( "auth.login" );
	}



}

