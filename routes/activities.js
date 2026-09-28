const express = require("express");
const router = express.Router();
const pool = require("../db");

// GET /api/activities — list all clubs / activities
router.get("/", async (req, res) => {
  try {
    const [rows] = await pool.query(
      "SELECT id, name, category, description FROM activities ORDER BY category, name"
    );
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Could not fetch activities" });
  }
});

module.exports = router;
