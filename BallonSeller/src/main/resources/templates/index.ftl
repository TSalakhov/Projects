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
      <li>
        <a href="/"><img src="img/party_baloon-96.png"  /></a>
      </li>
      <li>
        <a href="/">Air.mix </a>
    </ul>
      <#else>
         <ul>
            <li>
              <a href="/"><img src="img/party_baloon-96.png"  /></a></li>
            <li>
              <a href="/">Air.mix </a>
            </li>
              <li><a href="/login"> Вход в личный кабинет</a></li>
          </ul>
          </#if>
  </nav>
</div>
<div class="some">
<#if !currentUser??>
    <h2>Наши товары </h2>
    <#list items as item>
      <div class="items">
        <div class="image">
          <img src="/img/${item.filename}" />
        </div>
      <p>Название: ${item.name}</p>
      <p>Цена: ${item.cost} рублей</p>
      </div>
    </#list>
</#if>
  <#if currentUser??>
      <h2>Наши товары </h2>
      <div class="items">
        <form method="post" enctype="multipart/form-data" action="/AddItem">
                <#include "csrf.ftl">
                <input  name="name" id="name">
                <input  name="cost" id="cost">
                <input type="hidden" name="filename" id="filename">
                <button  type="submit" class="btn btn-outline-secondary">Добавить товар</button>
         </form>
      <#list items as item>
   <form method="POST" enctype="multipart/form-data" action="/refactorImage">
      <#include "csrf.ftl">
      <div class="refactorItem">
       <input type="hidden" value="${item.id}" id="id" name="id">
       <div class="image">
        <img src="/img/${item.filename}">
       </div>
       <input type="file" class="btn btn-primary"  name="file" />
       <button  type="submit" class="btn btn-outline-secondary">Сохранить изображение</button>
    </form>
    <form method="POST" enctype="multipart/form-data" action="/refactorItem">
      <#include "csrf.ftl">
      <input type="hidden" value="${item.id}" id="id" name="id">
      <input value="${item.name}" name="name" id="name">
      <input value="${item.cost}" name="cost" id="cost">
      <button  type="submit" class="btn btn-outline-secondary">Изменить информацию о товаре</button>
      </div>
    </form>
    </#list>
  </div>
</div>
<hr/>
</#if>
</body>
</html>
