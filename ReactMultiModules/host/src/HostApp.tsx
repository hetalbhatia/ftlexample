import React from "react";
import ReactDOM from "react-dom";
import ReactDOMCli from 'react-dom/client';
import {BrowserRouter, Route, Routes} from "react-router-dom";

import "./index.scss";

import Header from "layout/Header";
import Footer from "layout/Footer";
import Recipes from "pages/Recipes";
import Recipe from "pages/Recipe";

const HostApp = () => {
  console.log('HostApp is called');
  return (
  <div className="flex flex-col min-h-screen">
    <Header />
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Recipes />} />
          <Route path="/hello" element={<Recipes />} /><!-- this is to support spring app route -->
          <Route path="/recipes/:slug" element={<Recipe />} />
        </Routes>
      </BrowserRouter>
    <Footer />
  </div>
)};
// ReactDOM.render(<App />, document.getElementById("app"));



const root = ReactDOMCli.createRoot(document.getElementById('hostApp'));
console.log('HostApp file');
root.render(
  <React.StrictMode>
    <HostApp />
  </React.StrictMode>
);




