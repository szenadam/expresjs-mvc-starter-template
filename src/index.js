const express = require('express');
const app = express();
const dotenvFile = require('dotenv').config();
if (dotenvFile.error) throw dotenvFile.error;
const port = process.env.PORT;
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');

// Load Controllers
const homeController = require('./controllers/HomeController');

// Configure application
app.set('view engine', 'pug');
app.use(bodyParser.json());
app.use(cookieParser());

app.get('/', homeController);

app.listen(port, () =>
  console.log(`Example app listening at http://localhost:${port}`)
);
