<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <title>Hello World !</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <title>React App</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/>
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <script defer="defer" data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
    <!-- These are react and bable libraries
    <script src="https://unpkg.com/react@18/umd/react.development.js"></script>
    <script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
    -->
    <script src="https://unpkg.com/react@18/umd/react.production.min.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@18/umd/react-dom.production.min.js" crossorigin></script>
    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/react-bootstrap@next/dist/react-bootstrap.min.js" crossorigin></script>


    <script src="./bundle.js" type="text/babel" crossorigin="anonymous"></script>
    <script  src="http://localhost:3000/bundle.js" type="text/babel" ></script>

    <!-- Your react component entry point js
     - entry point js will contain reactdom.render code like given below
     const root = ReactDOM.createRoot(document.getElementById('id-should-match-with-ftl-page-id'));
        root.render(
          <>
            <ComponentName />
          </>
        );
      -
     -->

</head>
<body>
<h2>${name}: Hello World!</h2>
<div id="content">
    <div class="h-100" style="margin-right: 0; margin-left: 0;">
        <div class="row h-100">
            <div class="text-center">
                <noscript>You need to enable JavaScript to run this app.</noscript>
                <div id="hostApp">
                    <p>This is where host application should display</p>
                </div>

                <br/>
                <div id="root"></div>
            </div>
        </div>
    </div>
</div>


</body>
</html>