import express from "express";

import { signUp } from "../controllers/authControllers.js";
import { signUpValidate } from "../middlewares/authMiddlewares.js";

const router = express.Router();

router.post("/sign-up", signUpValidate, signUp);

export default router;
