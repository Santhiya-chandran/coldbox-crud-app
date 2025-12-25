// validation.js - form validation stubs
// Attach this script in layouts. Implement actual rules where TODO noted.

(function(global){
    'use strict';

    function showError(el, msg){
        // Simple inline error rendering; apps can replace with nicer UI
        var next = el.nextElementSibling;
        if (next && next.classList.contains('form-error')){
            next.textContent = msg;
        } else {
            var span = document.createElement('div');
            span.className = 'form-error text-danger small mt-1';
            span.textContent = msg;
            el.parentNode.insertBefore(span, el.nextSibling);
        }
    }

    function clearErrors(form){
        var errors = form.querySelectorAll('.form-error');
        errors.forEach(function(e){ e.remove(); });
    }

    function validateNotEmpty(el){
        return el && el.value && el.value.trim().length > 0;
    }

    // Login form: expects inputs with name=username and name=password
    function validateLoginForm(form){
        clearErrors(form);
        var username = form.querySelector('[name=username]');
        var password = form.querySelector('[name=password]');
        var ok = true;
        if (!validateNotEmpty(username)){
            showError(username, 'Username is required'); ok = false;
        }
        if (!validateNotEmpty(password)){
            showError(password, 'Password is required'); ok = false;
        }
        // TODO: Add more checks (min length, patterns)
        return ok;
    }

    // Create account form: expects name=username, name=password
    function validateCreateAccountForm(form){
        clearErrors(form);
        var username = form.querySelector('[name=username]');
        var password = form.querySelector('[name=password]');
        var ok = true;
        if (!validateNotEmpty(username)){
            showError(username, 'Username is required'); ok = false;
        }
        if (!validateNotEmpty(password)){
            showError(password, 'Password is required'); ok = false;
        }
        // TODO: Add password strength checks and username format
        return ok;
    }

    // Department forms: accepts either name/abbr or department_name/department_abbreviation
    function validateDepartmentForm(form){
        clearErrors(form);
        var name = form.querySelector('[name=department_name]') || form.querySelector('[name=name]');
        var abbr = form.querySelector('[name=department_abbreviation]') || form.querySelector('[name=abbr]');
        var ok = true;
        if (!validateNotEmpty(name)){
            if(name) showError(name, 'Department name is required');
            ok = false;
        }
        if (!validateNotEmpty(abbr)){
            if(abbr) showError(abbr, 'Abbreviation is required');
            ok = false;
        }
        // TODO: Add uniqueness checks via AJAX if desired
        return ok;
    }

    function attachValidation(){
        // Login forms
        var loginForms = document.querySelectorAll('form[action="/auth/authenticate"]');
        loginForms.forEach(function(f){
            f.addEventListener('submit', function(e){ if (!validateLoginForm(f)) e.preventDefault(); });
        });

        // Create account
        var createForms = document.querySelectorAll('form[action="/auth/createAccount"]');
        createForms.forEach(function(f){
            f.addEventListener('submit', function(e){ if (!validateCreateAccountForm(f)) e.preventDefault(); });
        });

        // Department create/update forms (conservative selectors)
        var deptForms = document.querySelectorAll('form[action="/departments/create"], form[action="/departments/update"]');
        deptForms.forEach(function(f){
            f.addEventListener('submit', function(e){ if (!validateDepartmentForm(f)) e.preventDefault(); });
        });
    }

    // Expose for manual calls and testing
    global.appValidation = {
        validateLoginForm: validateLoginForm,
        validateCreateAccountForm: validateCreateAccountForm,
        validateDepartmentForm: validateDepartmentForm,
        attach: attachValidation
    };

    // Auto attach on DOM ready
    document.addEventListener('DOMContentLoaded', function(){
        try{ attachValidation(); }catch(e){ console && console.warn && console.warn('validation attach failed', e); }
    });

})(window);
