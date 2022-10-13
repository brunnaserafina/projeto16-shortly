import express from "express";

import { shortenLink } from "../controllers/urlControllers.js";
import { urlValidate } from "../middlewares/schemaMiddlewares.js";
import { tokenValidate } from "../middlewares/authMiddlewares.js";

const router = express.Router();

router.post("/urls/shorten", tokenValidate, urlValidate, shortenLink);

export default router;
