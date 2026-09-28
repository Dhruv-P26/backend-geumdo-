// Tier 2 -> Tier 3 connection: a pooled MySQL connection.
// All values come from environment variables set in docker-compose.yml,
// so no credentials are hard-coded in the source code.
const mysql = require("mysql2/promise");

const pool = mysql.createPool({
  host: process.env.DB_HOST || "db",
  port: process.env.DB_PORT || 3306,
  user: process.env.DB_USER || "geumdo_user",
  password: process.env.DB_PASSWORD || "geumdo_pass",
  database: process.env.DB_NAME || "geumdo_db",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

module.exports = pool;
