import { STATUS_CODE } from "../enums/statusCode.js";
import connection from "../databases/pgsql.js";

export async function tokenValidate(req, res, next) {
  const token = req.headers.authorization?.replace("Bearer ", "");
  let existingToken;
  let idUser;

  try {
    if (token) {
      existingToken = (
        await connection.query(`SELECT * FROM sessions WHERE token=$1;`, [
          token,
        ])
      ).rows[0];
    }

    if (!token || !existingToken) {
      return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
    }

    idUser = existingToken.user_id;

    res.locals = { idUser };

    next();
  } catch (err) {
    console.error(err);
    return res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}
