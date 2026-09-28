const express = require("express");
const router = express.Router();
const pool = require("../db");

// POST /api/students/login — demo Student Portal login
// NOTE: for a real production system, passwords must be hashed (e.g. bcrypt)
// and never compared in plain text. This project keeps it simple on purpose
// so the 3-tier flow (frontend -> API -> MySQL) is easy to explain and demo.
router.post("/login", async (req, res) => {
  const { student_id, password } = req.body;
  if (!student_id || !password) {
    return res.status(400).json({ error: "student_id and password are required" });
  }
  try {
    const [rows] = await pool.query(
      "SELECT student_id, name, grade, homeroom, gpa FROM students WHERE student_id = ? AND password = ?",
      [student_id, password]
    );
    if (!rows.length) {
      return res.status(401).json({ error: "Invalid student ID or password" });
    }
    res.json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Login failed" });
  }
});

module.exports = router;
