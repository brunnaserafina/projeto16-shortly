import connection from "../databases/pgsql.js";
import { STATUS_CODE } from "../enums/statusCode.js";
import { nanoid } from "nanoid";

export async function shortenLink(req, res) {
  const { url } = req.body;
  const { idUser } = res.locals;

  let shortUrl;
  const numCharacters = 8;

  try {
    shortUrl = nanoid(numCharacters);

    await connection.query(
      `INSERT INTO links ("user_id", "link_url", "short_url") VALUES ($1, $2, $3);`,
      [idUser, url, shortUrl]
    );

    return res.status(STATUS_CODE.CREATED).send({ shortUrl: shortUrl });
  } catch (err) {
    console.error(err);
    return res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

