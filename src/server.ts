import express from "express";
import dotenv from "dotenv";

dotenv.config();

const app = express();

app.get('/', (req, res) => {
    return res.json([
        {
            id: 1,
            desc: "todo 1"
        },
        {
            id: 2,
            desc: "todo 2"

        },
        {
            id: 3,
            desc: "todo 3"
        }
    ])
})


app.listen(3000, () => {
    console.log("server started")
})
