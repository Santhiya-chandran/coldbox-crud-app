<cfoutput>
<h1>departments/new view</h1>

<!--- Use shared form partial --->
<cfset formAction = "/departments/create">
<cfset formMethod = "post">
<cfset submitLabel = "Create Department">
<cfinclude template="department_form.cfm">
</cfoutput>

<!--- handlers/
├── Auth.cfc
└── Department.cfc

views/
├── auth/
│   └── login.cfm
└── departments/
    ├── index.cfm
    ├── new.cfm
    └── edit.cfm

layouts/
├── Main.cfm
└── Login.cfm --->
