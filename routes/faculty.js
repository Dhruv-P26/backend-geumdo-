const express = require("express");
const router = express.Router();
const pool = require("../db");

// GET /api/faculty — list all faculty & staff
router.get("/", async (req, res) => {
  try {
    const [rows] = await pool.query(
      "SELECT id, name, role, department FROM faculty ORDER BY department, name"
    );
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Could not fetch faculty list" });
  }
});

module.exports = router;
