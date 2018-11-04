<html>
<head>
  <link rel="stylesheet"  href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <script  src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script  src= "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/css/login.css" />
  <link rel="stylesheet" href="/css/main.css" />
</head>
<body>
<#include "menu.ftl">
  <div class="login">
    <form method="post">
      <#include "csrf.ftl">
        <form class="login" role="form" action="/login" method="post">
           <div class="auth-block">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <label for="inputUsername" class="sr-only">Username</label>
            <input type="text" name="username" class="input-string" id="inputUsername" placeholder="логин" required autofocus/>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" name="password" class="input-string" id="inputPassword" placeholder="пароль" required/>
            </div>
            <button class="btn btn-success  " type="submit">Войти</button>
    </form>
  </div>
</body>
</html>
