import React from "react";
import ReactDOM from "react-dom";
import ReactDOMCli from 'react-dom/client';
import {BrowserRouter, Route, Routes} from "react-router-dom";

import "./index.scss";

import Header from "layout/Header";
import Footer from "layout/Footer";
import Recipes from "pages/Recipes";
import Recipe from "pages/Recipe";

const OneApp = () => {
    console.log('OneApp component is called');
    return 
    ( <>
        <h1>OneApp</h1>
    </> );
};

{/* <Header />
<BrowserRouter>
  <Routes>
    <Route path="/" element={<Recipes />} />
    <Route path="/recipes/:slug" element={<Recipe />} />
  </Routes>
</BrowserRouter>
<Footer /> */}

console.log('OneApp file');

export default function renderHostApp(props) {
  //let props = {container : "root", value: ""};
  const root = ReactDOMCli.createRoot(document.getElementById(props.container));
  console.log('OneApp renderHostApp');
  root.render(
    <React.StrictMode>
      <OneApp />
    </React.StrictMode>
  );
}

