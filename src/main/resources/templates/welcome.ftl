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
    <!--
    <script src="https://cdn.jsdelivr.net/npm/react/umd/react.production.min.js" crossorigin></script>
        <script src="https://cdn.jsdelivr.net/npm/react-dom/umd/react-dom.production.min.js" crossorigin></script>
    <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js"></script>

    <script src="./bundle.js" type="text/babel" crossorigin="anonymous"></script>
    -->



    <!--
    <script src="http://localhost:3000/src_OneApp_tsx.js" type="text/babel" crossorigin="anonymous"></script>

    <script src="http://localhost:3000/src_HostApp_tsx.js" type="text/babel" crossorigin="anonymous"></script>
    -->
   <!-- -->
    <script  src="http://localhost:3001/remoteEntry.js" type="text/babel""></script>
    <script  src="http://localhost:3002/remoteEntry.js" type="text/babel" ></script>
    <script  src="http://localhost:3000/remoteEntry.js" type="text/babel" ></script>

     <script src="http://localhost:3000/src_OneApp_tsx.js" type="text/babel" crossorigin="anonymous"></script>
     <script src="http://localhost:3000/src_HostApp_tsx.js" type="text/babel" crossorigin="anonymous"></script>

    <!--
    <script src="http://localhost:3001/src_Header_tsx.js" type="text/babel" crossorigin="anonymous"></script>
    <script src="http://localhost:3001/src_Footer_tsx.js" type="text/babel" crossorigin="anonymous"></script>
    <script src="http://localhost:3002/src_Recipes_tsx.js" type="text/babel" crossorigin="anonymous"></script>
    <script src="http://localhost:3002/src_Recipe_tsx.js" type="text/babel" crossorigin="anonymous"></script>
    -->

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
                <div id="page">
                    <p>This is where PAGE application should display</p>
                </div>
                <div id="helloApp">
                    <p>This is where JPP application should display helloApp react</p>
                </div>
                <div id="japp">
                    <p>This is where JPP application should display onpage react</p>
                </div>
                <br/>
                <div id="root">
                <!--
                    <script type="text/babel">
                        'use strict';
                        import HostApp from './src_HostApp_tsx';
                        ReactDOM.render(<HostApp />, document.getElementById('root'));
                    </script>
                    -->
                </div>
            </div>
        </div>
    </div>
</div>

<div id="welcomeApp"></div>


<div>
    <button onClick="window.loadHostApp('hostApp')">Load HOST React Component</button>
</div>
<!--
<script src="http://localhost:9000/host/remoteEntry.js" type="text/babel" crossorigin="anonymous"></script>
    <script src="http://localhost:9000/pages/remoteEntry.js" type="text/babel" crossorigin="anonymous"></script>
-->
<script>
function loadComponent(scope, module) {
  await __webpack_init_sharing__('default');
  const container = window[scope]; // or get the container somewhere else
  // Initialize the container, it may provide shared modules
  await container.init(__webpack_share_scopes__.default);
  const module = await container.get('./module');

  return async () => {
    // Initializes the shared scope. Fills it with known provided modules from this build and all remotes
    await __webpack_init_sharing__('default');
    const container = window[scope]; // or get the container somewhere else
    // Initialize the container, it may provide shared modules
    await container.init(__webpack_share_scopes__.default);
    const factory = await window[scope].get(module);
    const Module = factory();
    return Module;
  };
}

loadComponent('hostApp', 'HostApp');
</script>

<!--
<script type="text/babel">
'use strict';

const e = React.createElement;
    class LikeButton extends React.Component {
      constructor(props) {
        super(props);
        this.state = { liked: false };
      }

      render() {
        if (this.state.liked) {
          return 'You liked this.';
        }

        return e(
          'button',
          { onClick: () => this.setState({ liked: true }) },
          'Like'
        );
      }
    }
    class Jpp extends React.Component {
            render() {
                return(
                    <h1>Hello everyone nice to see it finally works!!!</h1>
                );
            }
        }
        const container = document.getElementById('helloApp')
        const root = ReactDOM.createRoot(container);
        root.render(<Jpp />);

        const pcont = document.querySelector('#japp')
        const page = ReactDOM.createRoot(pcont);
        page.render(e(LikeButton));
</script>
-->
<!--
<script src="http://localhost:3001/remoteEntry.js" type="text/babel" crossorigin="anonymous"></script>
    <script src="http://localhost:3002/remoteEntry.js" type="text/babel" crossorigin="anonymous"></script>
    <script src="http://localhost:3000/remoteEntry.js" type="text/babel" crossorigin="anonymous"></script>
<script src="./welcome.js" type="text/babel" data-preset="react"></script>
    -->
<script>
/*
setTimeout(alertFunc, 3000);

function alertFunc() {
    console.log('calling renderhost function');

  window.renderHostApp({ container: "hostApp", value: "123" });
}
*/
</script>


<script type="text/javascript">
function reloadHtml() {
  const cache = {}
  const plugin = {name: 'CustomHtmlReloadPlugin'}
  this.hooks.compilation.tap(plugin, compilation => {
    compilation.hooks.htmlWebpackPluginAfterEmit.tap(plugin, data => {
      const orig = cache[data.outputName]
      const html = data.html.source()
      if (orig && orig !== html) {
        devServer.sockWrite(devServer.sockets, 'content-changed')
      }
      cache[data.outputName] = html
    })
  })
}
</script>



</body>
</html>