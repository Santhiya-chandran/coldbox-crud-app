/**
 * I am a new Model Object
 */
component accessors="true"{

	// Properties
	property name="id" type="numeric";
	

	// Validation Constraints
	this.constraints = {
		// Example: age = { required=true, min="18", type="numeric" }
	};

	// Constraint Profiles
	this.constraintProfiles = {
		"update" : {}
	};

	// Population Control
	this.population = {
		include : [],
		exclude : [ "id" ]
	};

	// Mementifier
	this.memento = {
		// An array of the properties/relationships to include by default
		defaultIncludes = [ "*" ],
		// An array of properties/relationships to exclude by default
		defaultExcludes = [],
		// An array of properties/relationships to NEVER include
		neverInclude = [],
		// A struct of defaults for properties/relationships if they are null
		defaults = {},
		// A struct of mapping functions for properties/relationships that can transform them
		mappers = {}
	};

	/**
	 * Constructor
	 */
	departmentService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}

	public query function getAll() {
		query = queryExecute("SELECT * FROM departments", [], { datasource: "coldbox_app" });
		return query;
	}

	public any function create( string name, string abbr ) {
		queryExecute("INSERT INTO departments (department_name, department_abbreviation) VALUES (:name, :abbr)", 
			{ name = name, abbr = abbr }, 
			{ datasource: "coldbox_app" });
		return;
	}

	public query function getById( numeric id ) {
		query = queryExecute("SELECT * FROM departments WHERE department_id = :id", 
			{ id = { value = arguments.id, cfsqltype = "cf_sql_integer" } }, 
			{ datasource: "coldbox_app" });
		if ( query.recordCount > 0 ) {
			return query;
		} else {
			return {};
		}
	}

	public any function update( numeric id, string name, string abbr ) {
		queryExecute("UPDATE departments SET department_name = :name, department_abbreviation = :abbr WHERE department_id = :id", 
			{ name = name, abbr = abbr, id = { value = arguments.id, cfsqltype = "cf_sql_integer" } }, 
			{ datasource: "coldbox_app" });
		return;
	}

	public any function delete( numeric id ) {
		queryExecute("DELETE FROM departments WHERE department_id = :id", 
			{ id = { value = arguments.id, cfsqltype = "cf_sql_integer" } }, 
			{ datasource: "coldbox_app" });
		return;
	}



}