<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Alfonso
  Date: 21/01/2019
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pannello Amministratore</title>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/userFunction.js"></script>
    <script src="js/productFunction.js"></script>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Sublime project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
    <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
    <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
    <link rel="stylesheet" type="text/css" href="styles/responsive.css">

</head>
<body onload="loadMarche(); loadCatalog(); loadUsers()">
<%UserBean utente = new UserBean();

    if( session.getAttribute("utente")!= null)
        utente = (UserBean) session.getAttribute("utente");
    else

    {String redirectURL = "/index.jsp";
        response.sendRedirect(request.getContextPath() + redirectURL);
    }

%>

<div  class="super_container">
    <%@include  file="header.jsp" %>

    <hr>
    <div class="container bootstrap snippet" style="margin-top: 140px;">
        <div class="row">
            <div class="col-sm-10"><h1>Pannello Admin : <%=utente.getNome()%></h1></div>
        </div>
        <div class="row">
            <div class="col-sm-3"><!--left col-->


                <div class="text-center">
                    <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">

                </div></hr><br>






            </div><!--/col-3-->
            <div class="col-sm-9" style="margin-bottom: 5%;">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#tab1">Inserisci Articolo</a></li>
                    <li><a data-toggle="tab" href="#tab2">Rimuovi Articolo</a></li>
                    <li><a data-toggle="tab" href="#tab3">Inserisci Catalogo</a></li>
                    <li><a data-toggle="tab" href="#tab4">Rimuovi Catalogo</a></li>
                    <li><a data-toggle="tab" href="#tab5">Modifica Catalogo</a></li>
                    <li><a data-toggle="tab" href="#tab6">Visualizza Utenti</a></li>


                </ul>


                <div class="tab-content">
                    <div class="tab-pane active" id="tab1">
                        <hr>
                <form method="POST" action="ServletCreateProduct" enctype="multipart/form-data">
                        <div class="form-group"  >

                            <div class="col-xs-9" style="margin-bottom: 10px;">
                                <label for="product_name"><h4>Nome Prodotto</h4></label>
                                <input  type="text"  class="form-control" name="Nome_Prodotto" id="product_name" placeholder="" title="">
                            </div>
                        </div>
                        <div class="form-group" >

                            <div class="col-xs-9" style="margin-bottom: 10px;" >
                                <label for="desc_breve"><h4>Descrizione Breve</h4></label>
                                <input type="text"  class="form-control"  name="Descrizione_Breve" id="desc_breve" >
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-xs-9" style="margin-bottom: 10px;" >
                                <label for="desc_estesa"><h4>Descrizione Estesa</h4></label>
                                <textarea class="form-control"  name="Descrizione" id="desc_estesa"></textarea>
                            </div>
                        </div>

                        <div class="form-group" >
                            <div class="col-xs-9" style="margin-bottom: 10px;">
                                <label for="img1"><h4>Immagine 1</h4></label>
                                <input type="file"  class="form-control-file"  name="img1" id="img1">
                            </div>
                        </div>




                        <div class="form-group">
                            <div class="col-xs-9" style="margin-bottom: 10px;">
                                <label for="img2"><h4>Immagine 2</h4></label>
                                <input type="file"   class="form-control-file"   name="img2" id="img2">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-9" style="margin-bottom: 10px;">
                                <label for="img3"><h4>Immagine 3</h4></label>
                                <input type="file"  class="form-control-file"   name="img3" id="img3">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-9" style="margin-bottom: 10px;">
                                <label for="quantita"><h4>Quantità</h4></label>
                                <input type="number" min="0" class="form-control"  name="quantita" id="quantita">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-9" style="margin-bottom: 10px;">
                                <label for="prezzo"><h4>Prezzo</h4></label>
                                <input type="number" min="0" class="form-control"  name="Prezzo" id="prezzo">
                            </div>
                        </div>



                    <div class="form-group">
                        <div class="col-xs-9" style="margin-bottom: 10px;">
                            <label for="prezzo"><h4>Marca</h4></label>
                            <select name ="selectMarca" id="selectMarca">

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-9" style="margin-bottom: 10px;">
                            <label for="prezzo"><h4>Catalogo</h4></label>
                            <select name="selectCatalog" id="selectCatalog"></select>
                        </div>
                    </div>



                        <div class="form-group">
                            <div class="col-xs-12">
                                <br>

                                <input type="submit" class="btn btn-success btn-lg" name ="saveButton" value="Inserisci Articolo" id="save" onclick="">


                            </div>
                        </div>

                </form>
                        <hr>

                    </div><!--/tab-pane-->
                    <div class="tab-pane" id="tab2">

                        <h2></h2>

                        <hr>

                        <div class="form-group">

                            <div class="col-xs-6">
                                <label for="modvia"><h4>Via</h4></label>
                                <input type="text" class="form-control"  name="modvia" id="modvia" placeholder="es : Via Roma" readonly="readonly" title="">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-xs-6">
                                <label for="modcivico"><h4>civico</h4></label>
                                <input type="number" class="form-control" name="last_name" id="modcivico" placeholder="es: 10" readonly="readonly" title="">
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-xs-6">
                                <label for="modcomune"><h4>Comune</h4></label>
                                <input type="text" class="form-control" name="phone" id="modcomune" placeholder="es: Somma Vesuviana" title="" readonly="readonly">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-6">
                                <label for="modprovincia"><h4>Provincia</h4></label>
                                <input type="text" class="form-control" name="mobile" id="modprovincia" placeholder="Napoli" title="" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-xs-6">
                                <label for="modcap"><h4>CAP</h4></label>
                                <input type="number" class="form-control" name="email" id="modcap" placeholder="es: 80049" title="" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-xs-6">
                                <label for="modnazione"><h4>Nazione</h4></label>
                                <input type="text" class="form-control" id="modnazione" placeholder="es: ITALIA " title="" readonly="readonly">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12">
                                <br>
                                <input type="button" class="btn btn-warning" value="Modifica" id="modIndirizzo" onclick="enableMod(this)">
                                <input type="button" class="btn btn-success" value="Salva" name ="saveButton" id="saveIndirizzo" onclick="saveAddress(this)" style="display:none;">
                            </div>
                        </div>


                    </div><!--/tab-pane-->


                    <div class="tab-pane" id="tab3">

                    <h2></h2>

                    <hr>
                    <form method="POST" action="ServletCreateCatalog">
                    <div class="form-group">

                        <div class="col-xs-6">
                            <label for="modvia"><h4>Nome catalogo</h4></label>
                            <input type="text" class="form-control"  name="namecatalogo" id="namecatalogo" placeholder="es : Catalogo Monitor">
                        </div>
                    </div>
                    <div class="form-group">

                        <div class="col-xs-6">
                            <label for="desc_catalogo"><h4>Descrizione Catalogo</h4></label>
                           <textarea id="desc_catalogo" name="desc_catalogo"></textarea>
                        </div>
                    </div>

                    <div class="form-group">

                        <div class="col-xs-6">
                            <label for="modcomune"><h4>Sconto</h4></label>
                            <input type="number" class="form-control" min ="0" max="100" name="scontocatalogo" id="scontocatalogo" placeholder="es:10" >
                        </div>
                    </div>



                    <div class="form-group">
                        <div class="col-xs-12">
                            <br>

                            <input type="submit" class="btn btn-success btn-lg" value="Inserisci Catalogo" name ="saveCatalog" id="saveCatalog">
                        </div>
                    </div>
                    </form>

                </div>




                    <div class="tab-pane" id="tab4">

                        <h2></h2>

                        <hr>
                        <form method="POST" action="ServletDeleteCatalog">

                            <div class="form-group">
                                <div class="col-xs-9" style="margin-bottom: 10px;">
                                    <label ><h4>Catalogo</h4></label>
                                    <select name="selectCatalog" >
                                        <option value ="null"></option>

                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-xs-12">
                                    <br>

                                    <input type="submit" class="btn btn-danger btn-lg" value="Rimuovi Catalogo" name ="deleteCatalog" id="deleteCatalog">
                                </div>
                            </div>
                        </form>

                    </div>




                    <div class="tab-pane" id="tab5">

                        <h2></h2>

                        <hr>
                        <form method="POST" action="ServletUpdateCatalog">

                            <div class="form-group">
                                <div class="col-xs-9" style="margin-bottom: 10px;">
                                    <label ><h4>Catalogo</h4></label>
                                    <select name="selectCatalog" onchange="updateField(this)">
                                        <option value ="null"></option>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-9" style="margin-bottom: 10px;">
                                    <label ><h4>Nome Catalogo</h4></label>
                                    <input type="text" id="mod_namecatalog" name="mod_namecatalog" value ="" >
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-9" style="margin-bottom: 10px;">

                                    <textarea id="mod_descrizionecatalogo" name="mod_descrizionecatalogo" >Descrizione Catalogo</textarea>
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label ><h4>Sconto</h4></label>
                                    <input type="number" class="form-control" min ="0" max="100" name="modscontocatalogo" id="modscontocatalogo" value ="" placeholder="es:10" >
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-xs-12">
                                    <br>

                                    <input type="submit" class="btn btn-warning btn-lg" value="Applica Modifiche" name ="updateCatalog" id="updateCatalog">
                                </div>
                            </div>
                        </form>

                    </div>




                    <div class="tab-pane" id="tab6">
                        <% ArrayList<UserBean> utenti = new ArrayList<UserBean>();
                            utenti = (ArrayList<UserBean>) request.getAttribute("utenti");

                        %>
                        <h1><%=utenti.size()+"<---------------"%></h1>
                        <h2></h2>

                        <hr>


                            <div class="form-group">
                                <div class="col-xs-9" style="margin-bottom: 10px;">
                                    <label ><h4>Catalogo</h4></label>
                                    <select name="selectCatalog" onchange="updateField(this)">
                                        <option value ="null"></option>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-9" style="margin-bottom: 10px;">
                                    <label ><h4>Nome Catalogo</h4></label>
                                    <input type="text" id="mod_namecatalog" name="mod_namecatalog" value ="" >
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-9" style="margin-bottom: 10px;">

                                    <textarea id="mod_descrizionecatalogo" name="mod_descrizionecatalogo" >Descrizione Catalogo</textarea>
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label ><h4>Sconto</h4></label>
                                    <input type="number" class="form-control" min ="0" max="100" name="modscontocatalogo" id="modscontocatalogo" value ="" placeholder="es:10" >
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-xs-12">
                                    <br>

                                    <input type="submit" class="btn btn-warning btn-lg" value="Applica Modifiche" name ="updateCatalog" id="updateCatalog">
                                </div>
                            </div>


                    </div>

                </div><!--/tab-pane-->






            </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->

    <%@include  file="footer.jsp" %>
</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/greensock/TweenMax.min.js"></script>
<script src="plugins/greensock/TimelineMax.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/custom.js"></script>

</body>
</html>

