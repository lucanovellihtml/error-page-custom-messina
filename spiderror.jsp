<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
    <!-- css bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <title>Autenticazione Fallita</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="/openam/images/favicon.ico" type="image/x-icon" />
    <script> history.replaceState( {} , '', '/' ); </script>
</head>

<body>

    <!-- header -->
    <header class="w-100" style="height: 92px; background: #046bc4;">
    </header>


    <!-- main -->
    <main>

        <div class="container">
            <div class="row text-center">

                <!-- coll img -->
                <div class="col-12 mt-5">
                    <!-- img -->
                    <img src="/openam/images/logo.png" style="width: 400px; left: 385px">
                </div>

                <!-- get failurecode from param -->
                <c:choose>
                    <c:when test="${not empty fn:trim(param.failurecode) && param.failurecode.indexOf('nr') ne -1}">
                        <c:set var="failurecode" value='${param.failurecode.substring(param.failurecode.indexOf("nr") + 2)}' />
                    </c:when>
                    <c:otherwise>
                        <c:set var="failurecode" value='-1' />
                    </c:otherwise>
                </c:choose>

                <!-- coll title error -->
                <div class="col-12" style="padding-top: 35px;" id="ssoDiv">
                    <!-- title -->
                    <h1> Autenticazione Fallita </h1>

                    <!-- if type error title -->
                    <c:choose>
                        <c:when test="${failurecode == '1'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Autenticazione completata con successo</h2>
                        </c:when>
                        <c:when test="${failurecode == '2' || failurecode == '3'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Sistema di autenticazione non disponibile.<br>Riprovare più tardi</h2>
                                        </c:when>
                        <c:when test="${failurecode == '4'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Formato richiesta non corretto.<br>Contattare il gestore del servizio</h2>
                                        </c:when>
                        <c:when test="${failurecode == '5'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Impossibile stabilire l’autenticità della richiesta di autenticazione.<br>
                                Contattare il gestore del servizio</h2>
                        </c:when>
                        <c:when test="${failurecode == '6' || failurecode == '7' || failurecode == '10'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Formato richiesta non ricevibile.<br>Contattare il gestore del servizio
                            </h2>
                        </c:when>
                        <c:when
                            test="${failurecode == '8' || failurecode == '9' || failurecode == '11' || failurecode == '12' || failurecode == '13' || failurecode == '14' || failurecode == '15' || failurecode == '16' || failurecode == '17' || failurecode == '18'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Formato della richiesta non conforme alle specifiche SAML, il codice di
                                errore riportato è <c:out value='${failurecode}' />.<br>Contattare il gestore del servizio</h2>
                        </c:when>
                        <c:when test="${failurecode == '19'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Autenticazione fallita per ripetuta sottomissione di credenziali errate.<br>Contattare il fornitore SPID </h2>
                        </c:when>
                        <c:when test="${failurecode == '20'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Utente privo di credenziali compatibili con il livello SPID richiesto dal fornitore del servizio.<br>
                                Contattare il fornitore SPID</h2>
                        </c:when>
                        <c:when test="${failurecode == '21'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Timeout durante l'autenticazione utente</h2>
                        </c:when>
                        <c:when test="${failurecode == '22'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Negato il consenso all'invio di dati al Service Provider.<br>Per completare l'autenticazione SPID è obbligatorio dare il consenso</h2>
                        </c:when>
                        <c:when test="${failurecode == '23'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Le credenziali che si stanno utilizzando sono state sospese dall'utente o revocate/bloccate dal fornitore SPID.<br>
                                Contattare il fornitore SPID</h2>
                        </c:when>
                        <c:when test="${failurecode == '25'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Processo di autenticazione annullato dall'utente</h2>
                        </c:when>
                        <c:when test="${failurecode == '-1'}">
                            <h2 style="color: unset;border: 5px solid lightgrey; border-radius: 10px; padding:10px;">Il servizio non è momentaneamente disponibile.<br>Si prega di riprovare più tardi</h2>
                        </c:when>
                    </c:choose>
                    <!-- title link -->
                    <h3 style="color: unset; text-align: justify; text-align: center; ">Riprovare l'accesso al <a href="https://adspstretto.it/">portale</a>a cui si desiderava accedere.</h3>
                </div>
            </div>
        </div>
    </main>

    <!-- footer -->
    <footer class="w-100 position-fixed bottom-0" style="height: 92px; background: #046bc4;">
    </footer>

</body>

</html>
