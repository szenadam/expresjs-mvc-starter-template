const express = require("express");
const app = express();
const port = 3000;
const bodyParser = require("body-parser");

// Configure application
app.set("view engine", "pug");
app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.render("index");
});

app.listen(port, () =>
  console.log(`Example app listening at http://localhost:${port}`)
);
