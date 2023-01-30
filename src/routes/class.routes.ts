import { Router } from "express";
import { getClass } from "../controllers/class.controller"

const router = Router();

router.get("/class", getClass);

export default router;