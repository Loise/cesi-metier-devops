const dotenv = require("dotenv");
const express = require("express");
const cors = require("cors");
dotenv.config();

const app = express();

const corsOptions = {
  origin: process.env.FRONT_URL,
  optionsSuccessStatus: 200,
};

app.use(cors(corsOptions));
app.use(express.json());

// api routes

app.get('/', (req, res) => {
  res.send('Hello World')
})


module.exports = app;