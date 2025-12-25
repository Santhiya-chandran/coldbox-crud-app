/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	property name="userService" inject="UserService";

	function login( event ) {
		event.setView( "auth/login", "login" );
	}

	function authenticate( event ) {
		var user = userService.authenticate(
			event.getValue( "username" ),
			event.getValue( "password" )
		);

		if ( structIsEmpty( user ) ) {
			event.setView( "auth/login", "login" );
			return;
		}

		session.user = user;
		event.setRedirect( "/departments" );
	}

	function logout( event ) {
		structClear( session );
		event.setRedirect( "/login" );
	}



}

