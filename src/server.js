import express from "express";
import cors from "cors";
import dotenv from "dotenv";

import authRouter from "./routes/authRouter.js";

dotenv.config();

const server = express();

server.use(cors());
server.use(express.json());

server.get("/status", (req, res) => res.send("Ok!"));

server.use(authRouter);

server.listen(process.env.PORT, () =>
  console.log(`Listening on port ${process.env.PORT}`)
);
