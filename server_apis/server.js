const express = require("express");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const session = require("express-session");
const cors = require("cors");
require("dotenv").config();

const routers = require("./routes");
const models = require("./models");
const middleware = require("./middlewares");

const app = express();

models.sequelize
  .sync()
  .then(function () {
    console.log("Connected DB");
  })
  .catch(function (err) {
    console.log(err, "Something went wrong with the Database Update!");
  });

app.use("/public", express.static("public"));
app.use(express.json());
app.use(cookieParser());
app.use(express.urlencoded({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(
  session({
    secret: process.env.SESSION_SECRET,
    resave: true,
    saveUninitialized: true,
  })
);
app.use(cors());

const PORT = process.env.PORT || 3000;

// Apis routers
app.use("/auth", routers.authRoutes);
app.use("/user", middleware.authMiddleware, routers.userRoutes);

app.use(function (_, res) {
  res.status(404).json("404 Not Found!");
});

app.listen(PORT, (err) => {
  if (err) throw err;
  console.info(`> Ready on ${PORT}`);
});
