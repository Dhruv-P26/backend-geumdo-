const express = require("express");
const router = express.Router();
const pool = require("../db");

// GET /api/notices?limit=3 — latest school notices, used on the homepage
router.get("/", async (req, res) => {
  const limit = Math.min(parseInt(req.query.limit, 10) || 10, 50);
  try {
    const [rows] = await pool.query(
      "SELECT id, title, body, posted_on FROM notices ORDER BY posted_on DESC LIMIT ?",
      [limit]
    );
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Could not fetch notices" });
  }
});

module.exports = router;
