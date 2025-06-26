import express, { Application, Request, Response } from "express";
import cors from "cors";
import helmet from "helmet";
import morgan from "morgan";
import dotenv from "dotenv";

// Load environment variables
dotenv.config();

const app: Application = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(morgan("dev"));

// Basic route
app.get("/", (req: Request, res: Response) => {
  res.json({ message: "Pourhouse backend is running!" });
});

// Start server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
