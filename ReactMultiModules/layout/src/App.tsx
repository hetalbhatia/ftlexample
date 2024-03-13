import React from "react";
import ReactDOM from "react-dom";
import ReactDOMCli from 'react-dom/client';

import "./index.scss";

const App = () => (
  <div className="mt-10 text-3xl mx-auto max-w-6xl">
    <div><h1>Layout application</h1></div>
    <div>Name: layout</div>
    <div>Framework: react</div>
    <div>Language: TypeScript</div>
    <div>CSS: Tailwind</div>
  </div>
);
// ReactDOM.render(<App />, document.getElementById("layout"));

const root = ReactDOMCli.createRoot(document.getElementById('layout'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);



