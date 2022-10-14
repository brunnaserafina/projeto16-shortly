import express from "express";

import { getUser } from "../controllers/userControllers.js";
import { tokenValidate } from "../middlewares/authMiddlewares.js";

const router = express.Router();

router.get("/users/me", tokenValidate, getUser);

export default router;
