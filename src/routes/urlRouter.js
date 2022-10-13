import express from "express";

import { shortenLink, searchShortLink } from "../controllers/urlControllers.js";
import { urlValidate } from "../middlewares/schemaMiddlewares.js";
import { tokenValidate } from "../middlewares/authMiddlewares.js";

const router = express.Router();

router.post("/urls/shorten", tokenValidate, urlValidate, shortenLink);
router.get("/urls/:id", searchShortLink);

export default router;
