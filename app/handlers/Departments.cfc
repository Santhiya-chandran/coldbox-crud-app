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
		deptService.create(
			event.getValue( "name" ),
			event.getValue( "abbr" )
		);
		relocate( "departments" );
	}

	function edit( event, rc, prc ) {
		prc.dept = deptService.getById( event.getValue("id") )
		event.setView("departments/edit");
	}

	function update( event ) {
		deptService.update(
			event.getValue("id"),
			event.getValue("name"),
			event.getValue("abbr")
		);
		relocate( "departments" );
	}

	function delete( event ) {
		deptService.delete( event.getValue("id") );
		relocate( "departments" );
	}



}

