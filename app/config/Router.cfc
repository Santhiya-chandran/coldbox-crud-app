component {

	function configure(){
		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 */

		// A nice healthcheck route example
		route( "/healthcheck", function( event, rc, prc ){
			return "Ok!";
		} );

		// A nice RESTFul Route example
		route( "/api/echo", function( event, rc, prc ){
			return { "error" : false, "data" : "Welcome to my awesome API!" };
		} );

		// @app_routes@
		route( "/login", "Auth.login" );
		route( "/authenticate", "Auth.authenticate", "post" );
		route( "/auth/createAccount", "Auth.createAccount" );
		route( "/logout", "Auth.logout" );
		route( "/departments/new", "Departments.new");
		route( "/departments/create", "Departments.create", "post" );
		route( "/departments/edit/:id", "Departments.edit" );
		route( "/departments/update", "Departments.update", "post" );
		route( "/departments/delete/:id", "Departments.delete" );
		route( "/departments", "Departments.index" );


		// Conventions-Based Routing
		route( ":handler/:action?" ).end();
	}

}
