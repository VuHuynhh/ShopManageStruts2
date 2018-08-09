<%@taglib uri="/struts-tags" prefix="s" %>
<a href="#">Login</a>
<div class="tz-login-form">
    <form action="Login" method="POST">
        <p class="form-content">
            <label for="username">Email</label>
            <input type="text" name="email" id="username" value="">
        </p>
        <p class="form-content">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" value="">
        </p>
        <p class="form-footer">
            <a href="#">Lost Password?</a>
            <button type="submit" class="pull-right button_class">LOGIN</button>
        </p>
        <p class="form-text">
            Don't have an account? <a href="shop-register.html">Register Here</a>
        </p>
    </form>
</div>