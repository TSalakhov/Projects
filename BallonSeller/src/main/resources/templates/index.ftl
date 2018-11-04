<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet"  href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <script  src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script  src= "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/css/main.css" type="text/css">
  <link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<body>
  <div class="header">
  <nav id="main-menu">
   <#if currentUser??>
    <ul>
      <li><a href="/"><img src="img/party_baloon-96.png"  /></a></li>
      <li>
        <a href="/">Air.mix </a>
    </ul>
      <#else>
          <ul>
            <li><a href="/"><img src="img/party_baloon-96.png"  /></a></li>
            <li>
              <a href="/">Air.mix </a>
            </li>
              <li><a href="/login"> Вход в личный кабинет</a></li>
          </ul>
          </#if>
  </nav>
</div>
<#if !currentUser??>
<div class="some">
    <h2>Наши товары </h2>
    <div class="items">
    <#list items as item>
      <p>${item.name}</p>
      <p>${item.cost}</p>
      </#list>
      </#if>
      <#if currentUser??>
<form method="POST" enctype="multipart/form-data" action="/refactorImage">
<#include "csrf.ftl">
<div class="some">
    <h2>Наши товары </h2>
    <div class="items">
    <#list items as item>
       <input type="hidden" value="${item.id}" id="id" name="id">
        <img src="/img/${item.filename}">
      <input value="${item.name}" name="name" id="name">
      <input value="${item.cost}" name="cost" id="cost">
        <input type="file"  name="file" />
        <button type="submit"> Изменить </button>
      </#list>
		</form>
		</#if>
    </div>
  </div>
</body>
</html>
