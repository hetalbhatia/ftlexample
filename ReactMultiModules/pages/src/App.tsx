import React from "react";
import ReactDOM from "react-dom";
import ReactDOMCli from 'react-dom/client';

import "./index.scss";

const App = () => (
  <div className="mt-10 text-3xl mx-auto max-w-6xl">
    <div>Name: pages</div>
    <div>Framework: react</div>
    <div>Language: TypeScript</div>
    <div>CSS: Tailwind</div>
  </div>
);
// ReactDOM.render(<App />, document.getElementById("app"));


const root = ReactDOMCli.createRoot(document.getElementById('app'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
