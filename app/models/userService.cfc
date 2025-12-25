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
	userService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}

	function authenticate(
		required string username,
		required string password
	) returnType="struct" {

		var q = queryExecute(
			"SELECT * FROM users WHERE username = :u",
			{ u : arguments.username },
			{ datasource : "coldbox_app" }
		);

		if ( q.recordCount == 0 ) return {};

		var storedHash = q.password_hash[1];
		if ( hash( arguments.password ) != storedHash ) return {};

		var userRow = {};
		var cols = listToArray(q.columnList);
		for ( var i = 1; i LTE arrayLen(cols); i = i + 1 ){
			var col = cols[i];
			userRow[col] = q[col][1];
		}

		return userRow;
	}

	function create(
		required string username,
		required string password
	) {

		// check duplicate username
		var exists = queryExecute(
			"SELECT COUNT(*) AS cnt FROM users WHERE username = :u",
			{ u = arguments.username },
			{ datasource = "coldbox_app" }
		);
		if ( exists.cnt[1] GTE 1 ){
			return { success=false, message="Username already exists" };
		}

		queryExecute(
			"INSERT INTO users (username, password_hash) VALUES (:u, :p)",
			{
				u = arguments.username,
				p = hash( arguments.password )
			},
			{ datasource = "coldbox_app" }
		);

		return { success=true };
	}


}