<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <title>登录</title>
    <link href="${APP_PATH}/static/Wopop_files/style_log.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/Wopop_files/style.css">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/Wopop_files/userpanel.css">
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/Wopop_files/jquery.ui.all.css">
    <script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <script>
        $(document).on("click", "#button", function () {
        //    点击登录
            $("#loginForm").prop("action", "${APP_PATH}/login");
            $("#loginForm").submit();
        })
    </script>
</head>

<body class="login" mycollectionplug="bind">
<div class="login_m">
    <div class="login_logo"></div>
    <form method="post" id="loginForm">
        <div class="login_boder">

            <div class="login_padding" id="login_model">

                <h2>USERNAME</h2>
                <label>
                    <input type="text" id="username" name="username" class="txt_input txt_input2"
                           onfocus="if (value ==&#39;Your name&#39;){value =&#39;&#39;}"
                           onblur="if (value ==&#39;&#39;){value=&#39;Your name&#39;}" value="Your name">
                </label>
                <h2>PASSWORD</h2>
                <label>
                    <input type="password"  id="userpwd" class="txt_input" name="password"
                           onfocus="if (value ==&#39;******&#39;){value =&#39;&#39;}"
                           onblur="if (value ==&#39;&#39;){value=&#39;******&#39;}" value="******">
                </label>


                <div class="rem_sub">
                    ${msg}
                    <label>
                        <input type="submit" class="sub_button" name="button" id="button" value="SIGN-IN"
                               style="opacity: 0.7;">
                    </label>
                </div>
            </div>

        </div>
    </form>

            <!--login_padding  Sign up end-->
        </div><!--login_boder end-->
</div><!--login_m end-->


</body>
</html>