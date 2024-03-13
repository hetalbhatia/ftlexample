import React from "react";
import ReactDOM from "react-dom";
import ReactDOMCli from 'react-dom/client';
import {BrowserRouter, Route, Routes} from "react-router-dom";
import Recipes from './Recipes';
import Recipe from './Recipe';

import "./index.scss";

const root = ReactDOMCli.createRoot(document.getElementById('page'));
root.render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Recipes />} />
        <Route path="/recipes/:slug" element={<Recipe />} />
      </Routes>
    </BrowserRouter>
  </React.StrictMode>
);
