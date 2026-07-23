const express = require("express");
const cors = require("cors");
const pool = require("./db");

const app = express();

app.use(cors());
app.use(express.json());


// Get all employees
app.get("/employees", async (req, res) => {

    try {

        const result = await pool.query(
            "SELECT * FROM employees ORDER BY id"
        );

        res.json(result.rows);

    } catch (err) {

        console.error(err);

        res.status(500).send("Server Error");
    }

});


// Add employee
app.post("/employees", async (req, res) => {

    const { name, email, department } = req.body;

    try {

        await pool.query(

            `INSERT INTO employees
            (name,email,department)
            VALUES ($1,$2,$3)`,

            [name, email, department]

        );

        res.json({
            message: "Employee Added Successfully"
        });

    } catch (err) {

        console.error(err);

        res.status(500).send("Server Error");

    }

});


const PORT = 3000;

app.listen(PORT, () => {

    console.log(`Backend running on port ${PORT}`);

});