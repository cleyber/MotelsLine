<%--
    Document   : reservas
    Created on : 29-ago-2016, 20:39:32
    Author     : Cleyber
--%>
<%@page import="util.Routes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.dao.DaoServicios"%>
<%@page import="models.Servicios"%>
<%@page import="models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   boolean logged;
   if(session.getAttribute("usuario") == null) {
     logged = false;
    } else {
      logged = true;
    }

    Servicios servicios = new Servicios();
    DaoServicios dao = new DaoServicios();

    ArrayList<Servicios> array = new ArrayList();
    array = dao.consultarAll();
%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link href="<%=Routes.getUrl("css/materialize.min.css")%>" rel="stylesheet" type="text/css"/>
      <link href="<%=Routes.getUrl("css/style.css")%>" rel="stylesheet" type="text/css"/>
      <script src="<%=Routes.getUrl("js/jquery-3.0.0.min.js")%>" type="text/javascript"></script>
      <script src="<%=Routes.getUrl("js/usuario/reservar.js")%>" type="text/javascript"></script>
      <script src="<%=Routes.getUrl("js/materialize.min.js")%>" type="text/javascript"></script>
      <link href="<%=Routes.getUrl("css/sweetalert.css")%>" rel="stylesheet" type="text/css"/>
      <script src="<%=Routes.getUrl("js/sweetalert.min.js")%>" type="text/javascript"></script>

      <script>

            var logged = <%=logged%>;

      </script>

    </head>
        <%@include file="menuUser.jsp" %>
    <body>
        <section class="container">
            <div>
                <div class="row">
                    <div class="col m3">
                        <h5 class="center-align">Servicios</h5>
                    </div>
                    <div class="col m3">
                        <h5 class="center-align">Fecha</h5>
                    </div>
                    <div class="col m3">
                        <h5 class="center-align">Inicio de sesión</h5>
                    </div>
                    <div class="col m3">
                        <h5 class="center-align">Resumen</h5>
                    </div>
                </div>
                <div class="progress blue lighten-4">
                    <div class="determinate blue" style="width: 25%" id="wizard_progress"></div>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <div class="card">
                        <div class="card-content">
                            <form>
                                <div id="form_servicios"><!--Servicios-->
                                    <div class="row">
                                     <%
                                        for(Servicios servicio  : array){
                                    %>
                                    <div class="col s12 m3">
                                        <div>
                                            <input type="checkbox" id="<%=servicio.getId()%>" class="servicio" value="<%=servicio.getNombre()%>" name="servicio">
                                            <label for="<%=servicio.getId()%>"><%=servicio.getNombre()%></label>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    </div>
                                    <div class="right-align">
                                        <button  id="siguiente_fecha" class="btn waves-effect blue">Siguiente</button>
                                    </div>
                                </div>

                                <div id="form_fecha" class="hide"> <!--Fecha-->
                                    <div class="row">
                                        <div class="col m6 s12 ">
                                            <h5>Seleccione la fecha</h5>
                                            <div>
                                                <input type="date" class="datepicker">
                                            </div>
                                        </div>
                                        <div class="col m6 s12">
                                            <h5>Seleccione la hora</h5>
                                            <div class="row ">
                                                <div class="col m4 " id="hora">
                                                    <select>
                                                        <option value="01">01</option>
                                                        <option value="02">02</option>
                                                        <option value="03">03</option>
                                                        <option value="04">04</option>
                                                        <option value="05">05</option>
                                                        <option value="06">06</option>
                                                        <option value="07">07</option>
                                                        <option value="08">08</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                    </select>
                                                </div>
                                                <div class="col m4" id="minutos">
                                                    <select>
                                                        <option value="00">00</option>
                                                        <option value="01">01</option>
                                                        <option value="02">02</option>
                                                        <option value="03">03</option>
                                                        <option value="04">04</option>
                                                        <option value="05">05</option>
                                                        <option value="06">06</option>
                                                        <option value="07">07</option>
                                                        <option value="08">08</option>
                                                        <option value="09">09</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                        <option value="13">13</option>
                                                        <option value="14">14</option>
                                                        <option value="15">15</option>
                                                        <option value="16">16</option>
                                                        <option value="17">17</option>
                                                        <option value="18">18</option>
                                                        <option value="19">19</option>
                                                        <option value="21">21</option>
                                                        <option value="22">22</option>
                                                        <option value="23">23</option>
                                                        <option value="24">24</option>
                                                        <option value="25">25</option>
                                                        <option value="26">26</option>
                                                        <option value="27">27</option>
                                                        <option value="28">28</option>
                                                        <option value="29">29</option>
                                                        <option value="30">30</option>
                                                        <option value="31">31</option>
                                                        <option value="32">32</option>
                                                        <option value="33">33</option>
                                                        <option value="34">34</option>
                                                        <option value="35">35</option>
                                                        <option value="36">36</option>
                                                        <option value="37">37</option>
                                                        <option value="38">38</option>
                                                        <option value="39">39</option>
                                                        <option value="40">40</option>
                                                        <option value="41">41</option>
                                                        <option value="42">42</option>
                                                        <option value="43">43</option>
                                                        <option value="44">44</option>
                                                        <option value="45">45</option>
                                                        <option value="46">46</option>
                                                        <option value="47">47</option>
                                                        <option value="48">48</option>
                                                        <option value="49">49</option>
                                                        <option value="50">50</option>
                                                        <option value="51">51</option>
                                                        <option value="52">52</option>
                                                        <option value="53">53</option>
                                                        <option value="54">54</option>
                                                        <option value="55">55</option>
                                                        <option value="56">56</option>
                                                        <option value="57">57</option>
                                                        <option value="58">58</option>
                                                        <option value="59">59</option>
                                                    </select>
                                                </div>
                                                <div class="col m4" id="meridiano">
                                                    <select>
                                                        <option value="am" selected>AM</option>
                                                        <option value="pm">PM</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col m6 s12">
                                            <div class="input-field">
                                                <label for="perExtra">Personas Extras</label>
                                                <input type="number" id="perExtra">
                                            </div>
                                        </div>
                                        <div class="col m6 s12">
                                            <div class="input-field">
                                                <label for="horaExtra">Horas Extras</label>
                                                <input type="number" id="horaExtra">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="left-align col s6">
                                           <button id="fecha_atras" class="btn waves-effect blue">Atras</button>
                                        </div>
                                        <% if(logged){ %>
                                        <div class="right-align col s6">
                                          <button id="guardar_reserva" class="btn waves-effect blue">Guardar</button>
                                       </div>
                                       <% }else{ %>
                                        <div class="right-align col s6">
                                           <button id="siguiente_login" class="btn waves-effect blue">Siguiente</button>
                                        </div>
                                       <% } %>
                                    </div>
                                </div>

                                 <form action="loginServlet" method="post"><!--Login-->
                                    <div id="form_login" class="hide"><!--Login-->
                                       <div class="row">
                                          <h4 class="center-align">Iniciar sesión</h4>
                                          <h6 id="pregunta" class="center-align"><a href="<%=Routes.getUrl("registrar.jsp")%>">¿No tienes una cuenta? Registrate</a></h6>
                                          <div class="col s12 col m8 offset-m2">
                                             <div class="input-field">
                                                <label for="correo">Correo</label>
                                                <input type="email" id="correo" name="correo">
                                             </div>
                                             <div class="input-field">
                                                <label for="clave">Clave</label>
                                                <input type="password" id="clave" name="clave">
                                             </div>
                                             <div class="right-align">
                                                <a href="#">¿Olvidaste tu clave?</a>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="row">
                                          <div class="left-align col s6">
                                             <button id="login_atras" class="btn waves-effect blue">Atras</button>
                                          </div>
                                          <div class="right-align col s6">
                                             <button class="btn waves-effect blue" name="action" type="submit">iniciar sesion</button>
                                          </div>
                                       </div>
                                    </div>
                                 </form>


                                <div id="form_resumen" class="hide"><!--Resumen-->
                                    <div  id="ok" class="hide">
                                        <div class="row">
                                           <div class="valign-wrapper">
                                              <div class="col s6 valign center">
                                                 <img src="<%=Routes.getUrl("img/check.png")%>"  alt="OK"/>
                                              </div>
                                              <div class="col s6">
                                                 <h3>Usted a reservado:</h3>
                                                 <p><b>Habitación:</b> </p>
                                                 <p><b>Servicios:</b> </p>
                                                 <p><b>Día:</b> </p>
                                                 <p><b>Hora:</b> </p><br>
                                                 <p><b>Gracias por reservas en MotelsLine..</b></p>
                                              </div>
                                           </div>
                                        </div>
                                    </div>
                                    <div class="hide" id="error">
                                        <div class="row">
                                            <div class="valign-wrapper">
                                                <div class="col s6 valign center">
                                                    <img src="<%=Routes.getUrl("img/error.png")%>"  alt="ERROR" />
                                                </div>
                                                <div class="col s6">
                                                    <h2>Ha ocurrido un error en su reserva</h2>
                                                    <h4 id="mensaje"></h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                              <div class="left-align" style="margin-top: 20px;">
                                                  <button class="btn waves-effect blue" id="atras_error">atras</button>
                                              </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
