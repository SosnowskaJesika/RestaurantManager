const mysql = require("mysql2");

const db = mysql.createConnection({
  host: "localhost",
  database: "restaurant_manager_db",
  user: "root",
  password: "",
});

db.connect(function (err) {
  if (err) throw err;
  console.log("Database connected!");
});

module.exports = db;
