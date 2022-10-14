import express from "express";

import { getUser, getRanking } from "../controllers/userControllers.js";
import { tokenValidate } from "../middlewares/authMiddlewares.js";

const router = express.Router();

router.get("/users/me", tokenValidate, getUser);
router.get("/ranking", getRanking);

export default router;
