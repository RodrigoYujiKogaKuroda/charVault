import cors from "cors";
import express, { json } from "express";
import classRouter from "./routes/class.routes"

const app = express();
app.use(json());
app.use(cors());
app.use(classRouter);

const PORT = process.env.PORT || 5432;
app.listen(PORT, () => {
  console.log(`Running on port ${PORT}`);
});
