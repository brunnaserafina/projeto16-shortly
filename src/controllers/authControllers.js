import connection from "../databases/pgsql.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import bcrypt from "bcrypt";

export async function signUp(req, res) {
  const { name, email, password } = res.locals;

  try {
    const existingEmail = await connection.query(
      "SELECT * FROM users WHERE email=$1;",
      [email]
    );

    if (existingEmail.rowCount > 0) {
      return res.sendStatus(STATUS_CODE.CONFLICT);
    }

    const passwordHash = bcrypt.hashSync(password, 12);

    await connection.query(
      "INSERT INTO users (name, email, password) VALUES ($1, $2, $3);",
      [name, email, passwordHash]
    );

    return res.sendStatus(STATUS_CODE.CREATED);
  } catch (err) {
    console.error(err);
    return res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}
