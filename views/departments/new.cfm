<cfoutput>
<h1>departments/new view</h1>

<form action="/departments/create" method="post">
    <div class="mb-3">
        <label for="name" class="form-label">Department Name</label>
        <input type="text" class="form-control" id="name" name="name" required>
    </div>
    <div class="mb-3">
        <label for="abbr" class="form-label">Department Abbreviation</label>
        <input type="text" class="form-control" id="abbr" name="abbr" required>
    </div>
    <button type="submit" class="btn btn-primary">Create Department</button>
</form>
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
