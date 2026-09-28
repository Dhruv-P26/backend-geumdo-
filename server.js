// Geumdo High School — Tier 2: Application / API layer (Node.js + Express)
require("dotenv").config();
const express = require("express");
const cors = require("cors");

const facultyRoutes = require("./routes/faculty");
const activitiesRoutes = require("./routes/activities");
const noticesRoutes = require("./routes/notices");
const contactRoutes = require("./routes/contact");
const studentsRoutes = require("./routes/students");

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// Health check — used by docker-compose healthcheck and load balancer target group
app.get("/api/health", (req, res) => {
  res.json({ status: "ok", service: "geumdo-backend", time: new Date().toISOString() });
});

app.use("/api/faculty", facultyRoutes);
app.use("/api/activities", activitiesRoutes);
app.use("/api/notices", noticesRoutes);
app.use("/api/contact", contactRoutes);
app.use("/api/students", studentsRoutes);

app.use((req, res) => res.status(404).json({ error: "Not found" }));

app.listen(PORT, () => {
  console.log(`Geumdo backend API listening on port ${PORT}`);
});
