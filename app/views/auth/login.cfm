<cfoutput>
<h1>auth.login</h1>

<div class="card">
    <div class="card-body">
        <!-- Flash message -->
        <cfif structKeyExists( flash, "message" )>
            <div class="alert alert-#flash.message.type#">#flash.message.text#</div>
        </cfif>
        <form method="post" action="/auth/authenticate">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
            <a href="/auth/createAccount" class="btn btn-link">Create Account</a>
        </form>
    </div>
</div>
</cfoutput>
