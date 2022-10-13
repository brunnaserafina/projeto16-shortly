import connection from "../databases/pgsql.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

export async function signUp(req, res) {
  const { name, email, password } = res.locals;
  let passwordHash;

  try {
    const existingEmail = await connection.query(
      `SELECT * FROM users WHERE email=$1;`,
      [email]
    );

    if (existingEmail.rowCount > 0) {
      return res.sendStatus(STATUS_CODE.CONFLICT);
    }

    passwordHash = bcrypt.hashSync(password, 12);

    await connection.query(
      `INSERT INTO users (name, email, password) VALUES ($1, $2, $3);`,
      [name, email, passwordHash]
    );

    return res.sendStatus(STATUS_CODE.CREATED);
  } catch (err) {
    console.error(err);
    return res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export async function signIn(req, res) {
  const { email, password } = res.locals;
  let validPassword;
  let token;

  try {
    const user = (
      await connection.query(`SELECT * FROM users WHERE email=$1;`, [email])
    ).rows[0];

    if (user) {
      validPassword = bcrypt.compareSync(password, user.password);
    }

    if (!user || !validPassword) {
      return res
        .status(STATUS_CODE.UNAUTHORIZED)
        .send({ message: "E-mail ou senha incorretos!" });
    }

    token = uuid();

    await connection.query(
      `INSERT INTO sessions ("user_id", token) VALUES ($1, $2);`,
      [user.id, token]
    );

    return res.status(STATUS_CODE.OK).send({ token: token });
  } catch (err) {
    console.error(err);
    return res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}
