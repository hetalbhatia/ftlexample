'use strict';

import React from "react";

import ReactDOM from 'react-dom';

function App() {
  return (
    <div>
        <h1>Hello Everyone</h1>
    </div>
);
}




ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('welcomeApp')
);