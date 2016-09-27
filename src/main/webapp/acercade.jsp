<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/acercade.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <script src="js/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="js/materialize.min.js" type="text/javascript"></script>
    <title>Acerca de</title>
  </head>
  <body>
    <%@include file="usuario/menuUser.jsp" %>
    <header id="cabezera">
      <h1 class="titulo center-align">Acerca de MotelsLine</h1>
    </header>
    <section id="info">
      <div class="contenedor">
        <div class="info-motel"><img src="img/quien_somos.jpg" alt="" />
          <ul class="collapsible" data-collapsible="accordion">
          <li>
            <div class="collapsible-header">Quienes somos</div>
            <div class="collapsible-body"><p class="texto">Somos Una empresa joven y dinámica<br> que entiende la creación de<br> contenidos de calidad como el<br> fundamento del futuro de Internet.<br>
               Son muchos ya los visitantes <br> fieles de nuestro y deseamos <br> que sean muchos más en el futuro.</p>
            </div>
          </li>
        </ul>
        </div>
        <div class="info-motel">
          <img src="img/donde_estamos.png" alt="" />
          <ul class="collapsible" data-collapsible="accordion">
          <li>
            <div class="collapsible-header">Donde estamos</div>
            <div class="collapsible-body"><p>Nos encontramos en la<br> Ciudada de Medellin Antioquia</div>
          </li>
        </ul>
        </div>
        <div class="info-motel">
          <img src="img/que_hacemos.png" alt="" />
          <ul class="collapsible" data-collapsible="accordion">
          <li>
            <div class="collapsible-header">Que hacemos</div>
            <div class="collapsible-body"><p>Nos encargamos de brindarle<br> una informacion clara y confiable<br> a nuestros usuarios, para que<br> asi se sientan seguros y<br> ahorren elmayor tiempo
            posible</p></div>
          </li>
        </ul>
        </div>
        <div class="info-motel">
          <img src="img/fecha.jpg" alt="" />
          <h6></h6>
    <ul class="collapsible" data-collapsible="accordion">
    <li>
      <div class="collapsible-header">Desde cuando lo hacemos</div>
      <div class="collapsible-body"><p>Este proyecto empezo en el año 2015</p></div>
    </li>
  </ul>
</ul>
        </div>
      </div>
    </section>

<div class="divider">

</div>

<div class="col s12 m8 offset-m2 l6 offset-l3 container">
    <div class="col s10 center-align">
    </div>
        <div class="card-panel grey lighten-5 z-depth-1">
          <div class="center-align">
        <h4 class="black-text">Conozca el equipo de trabajo</h4>
          </div>
          <br>
          <div class="row valign-wrapper">
            <div class="col s2">
              <img src="img/slider.jpg" alt="" class="circle responsive-img">
            </div>
            <div class="col s10">
              <span class="black-text">
                <b>Esteban Giraldo</b><p>This is a square image. Add the "circle" class to it to make it appear circular.</p>
              </span>
            </div>
          </div>
          <div class="row valign-wrapper">
            <div class="col s2">
              <img src="img/porta.jpg" alt="" class="circle responsive-img">
            </div>
            <div class="col s10">
              <span class="black-text">
                <b>Yeison Hinestroza</b><p>This is a square image. Add the "circle" class to it to make it appear circular.</p>
              </span>
            </div>
          </div>
          <div class="row valign-wrapper">
            <div class="col s2">
              <img src="img/slider.jpg" alt="" class="circle responsive-img">
            </div>
            <div class="col s10">
              <span class="black-text">
              <b>Cleyber Rengifo</b> <p>La pera, encargado de hacer lo que le de la puta gana. "back-ends"</p>
              </span>
            </div>
          </div>
          <div class="row valign-wrapper">
            <div class="col s2">
              <img src="img/slider.jpg" alt="" class="circle responsive-img">
            </div>
            <div class="col s10">
              <span class="black-text">
              <b>Anderson Velez</b><p>Diseñador de software.</p>
              </span>
            </div>
          </div>
        </div>
      </div>
  <footer class="page-footer grey darken-4">
    <div class="container">
      <div class="row">
        <div class="col l6 s12">
          <h5 class="white-text">MotelsLine</h5>
          <p class="grey-text text-lighten-4">Dirección: </p>
        </div>
        <div class="col l4 offset-l2 s12">
          <h5 class="white-text">Redes sociales</h5>
          <ul class="valign-wrapper">
              <li><a class="grey-text text-lighten-3 valign" href="#!"><img src="img/icon/f2.png"></a></li>
              <li><a class="grey-text text-lighten-3 valign" href="#!"><img src="img/icon/twitter.png"></a></li>
              <li><a class="grey-text text-lighten-3" href="#!"><img src="img/icon/youtube.png"></a></li>
              <li><a class="grey-text text-lighten-3" href="#!"><img src="img/icon/google.png"></a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="footer-copyright black">
      <div class="container">
      © 2016 Copyright MotelsLine
      <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
      </div>
    </div>
</footer>
  </body>
</html>
