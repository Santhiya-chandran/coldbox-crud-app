component extends="coldbox.system.EventHandler" {

	/**
	 * Default Action
	 */
	function index( event, rc, prc ){
		prc.welcomeMessage = "Welcome to ColdBox!";
		event.setView( "main/index" );
	}

	/**
	 * Produce some restfulf data
	 */
	function data( event, rc, prc ){
		return [
			{ "id" : createUUID(), name : "Luis" },
			{ "id" : createUUID(), name : "JOe" },
			{ "id" : createUUID(), name : "Bob" },
			{ "id" : createUUID(), name : "Darth" }
		];
	}


	/**
	 * error
	 */
	function error( event, rc, prc ){
		event.settttView( "Main/error" );
	}


	/**
	 * Relocation example
	 */
	function doSomething( event, rc, prc ){
		relocate( "main.index" );
	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit( event, rc, prc ){
	}

	function onRequestStart( event, rc, prc ){
		// Enforce authentication for non-auth handlers and implement 10-minute inactivity timeout
		var handler = event.getCurrentHandler();
		var action = event.getCurrentAction();
		// allow public endpoints
		var openHandlers = [ "auth", "main" ];
		if ( not listFindNoCase( arrayToList(openHandlers), handler ) ){
			if ( structKeyExists( session, "user" ) ){
				// check inactivity (10 minutes)
				if ( structKeyExists( session, "lastActivity" ) ){
					var elapsed = dateDiff( "s", session.lastActivity, now() );
					if ( elapsed GTE 600 ){
						structClear( session );
						flash.message = { type="warning", text="Session timed out. Please login again." };
						relocate( "auth.login" );
					}
				}
				// update last activity
				session.lastActivity = now();
			} else {
				// not logged in
				flash.message = { type="info", text="Please login to continue." };
				relocate( "auth.login" );
			}
		}
	}

	function onRequestEnd( event, rc, prc ){
	}

	function onSessionStart( event, rc, prc ){
	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

}
