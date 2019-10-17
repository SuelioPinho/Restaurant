<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
    <img class="form-signin" style="margin-right: 16px;" src="https://image.flaticon.com/icons/svg/320/320366.svg" alt="" width="44" height="44">
    <a class="navbar-brand" href="#">Restaurante</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/restaurant">Home <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<main role="main" class="container">

    <g:layoutBody/>

</main>


%{--<div class="footer row" role="contentinfo">--}%
%{--    <div class="col">--}%
%{--        <a href="http://guides.grails.org" target="_blank">--}%
%{--            <asset:image src="advancedgrails.svg" alt="Grails Guides" class="float-left"/>--}%
%{--        </a>--}%
%{--        <strong class="centered"><a href="http://guides.grails.org" target="_blank">Grails Guides</a></strong>--}%
%{--        <p>Building your first Grails app? Looking to add security, or create a Single-Page-App? Check out the <a href="http://guides.grails.org" target="_blank">Grails Guides</a> for step-by-step tutorials.</p>--}%

%{--    </div>--}%
%{--    <div class="col">--}%
%{--        <a href="http://docs.grails.org" target="_blank">--}%
%{--            <asset:image src="documentation.svg" alt="Grails Documentation" class="float-left"/>--}%
%{--        </a>--}%
%{--        <strong class="centered"><a href="http://docs.grails.org" target="_blank">Documentation</a></strong>--}%
%{--        <p>Ready to dig in? You can find in-depth documentation for all the features of Grails in the <a href="http://docs.grails.org" target="_blank">User Guide</a>.</p>--}%

%{--    </div>--}%

%{--    <div class="col">--}%
%{--        <a href="https://grails-slack.cfapps.io" target="_blank">--}%
%{--            <asset:image src="slack.svg" alt="Grails Slack" class="float-left"/>--}%
%{--        </a>--}%
%{--        <strong class="centered"><a href="https://grails-slack.cfapps.io" target="_blank">Join the Community</a></strong>--}%
%{--        <p>Get feedback and share your experience with other Grails developers in the community <a href="https://grails-slack.cfapps.io" target="_blank">Slack channel</a>.</p>--}%
%{--    </div>--}%
%{--</div>--}%


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
