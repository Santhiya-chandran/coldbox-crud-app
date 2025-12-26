/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	property name="deptService" inject="service:DepartmentService";

	/**
	 * Display a listing of the resource
	 */
	function index( event, rc, prc ){
		prc.depts = deptService.getAll();
		event.setView("departments/index");
	}

	function new( event ) {
		event.setView("departments/new");
	}

	function create( event ) {
		try {
			deptService.create(
				event.getValue( "name" ),
				event.getValue( "abbr" )
			);
			relocate( "departments" );
		} catch ( any e ) {
			if ( structKeyExists( e, 'type' ) AND e.type == 'validation' ) {
				var flash = controller.getRequestService().getFlashScope();
				var errs = {};
				if ( structKeyExists( e, 'field' ) ) {
					errs[ e.field ] = e.message;
				} else {
					errs.name = e.message;
				}
				flash.putAll( { errors = errs, name = event.getValue("name"), abbr = event.getValue("abbr") }, true );
				relocate( event="departments.new" );
			} else {
				throw e;
			}
		}
	}

	function edit( event, rc, prc ) {
		var q = deptService.getById( event.getValue("id") );
		var deptStruct = {};
		if ( isQuery( q ) AND q.recordCount ) {
			deptStruct = {
				department_id = q.department_id[1],
				department_name = q.department_name[1],
				department_abbreviation = q.department_abbreviation[1]
			};
		}

		// If any values were persisted into the flash (inflated to RC), prefer them so the form
		// shows the user's last input after a validation failure.
		if ( structKeyExists( rc, 'id' ) ) deptStruct.department_id = rc.id;
		if ( structKeyExists( rc, 'name' ) ) deptStruct.department_name = rc.name;
		if ( structKeyExists( rc, 'abbr' ) ) deptStruct.department_abbreviation = rc.abbr;
		if ( structKeyExists( rc, 'errors' ) ) prc.errors = rc.errors;

		prc.dept = deptStruct;
		event.setView("departments/edit");
	}

	function update( event ) {
		try {
			deptService.update(
				event.getValue("id"),
				event.getValue("name"),
				event.getValue("abbr")
			);
			relocate( "departments" );
		} catch( any e ) {
			// Handle validation error thrown by the service (e.g., duplicate abbreviation)
			if ( structKeyExists( e, 'type' ) AND e.type == 'validation' ) {
				var flash = controller.getRequestService().getFlashScope();
				var errs = {};
				if ( structKeyExists( e, 'field' ) ) {
					errs[ e.field ] = e.message;
				} else {
					errs.abbr = e.message;
				}
				flash.putAll( { errors = errs, id = event.getValue("id"), name = event.getValue("name"), abbr = event.getValue("abbr") }, true );
				relocate( event="departments.edit", queryString={ id = event.getValue("id") } );
			} else {
				throw e;
			}
		}
	}

	function delete( event ) {
		deptService.delete( event.getValue("id") );
		relocate( "departments" );
	}



}

