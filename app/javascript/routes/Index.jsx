import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "../components/Home";
import Campings from "../components/Campings";

export default (
  <Router>
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/campings" element={<Campings />} />
    </Routes>
  </Router>
);