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

export async function searchShortLink(req, res) {
  const { id } = req.params;

  try {
    const existingId = (
      await connection.query(`SELECT * FROM links WHERE id=$1;`, [id])
    ).rows[0];

    if (!existingId) {
      return res.sendStatus(STATUS_CODE.NOT_FOUND);
    }

    return res
      .status(STATUS_CODE.OK)
      .send({ id, shortUrl: existingId.short_url, url: existingId.link_url });
  } catch (err) {
    console.error(err);
    return res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export async function redirectLink(req, res) {
  const { shortUrl } = req.params;

  let idUrl;
  let idUser;
  let link;

  try {
    const existingShortUrl = (
      await connection.query(`SELECT * FROM links WHERE "short_url"=$1;`, [
        shortUrl,
      ])
    ).rows[0];

    if (existingShortUrl === undefined) {
      return res.sendStatus(STATUS_CODE.NOT_FOUND);
    }

    idUrl = existingShortUrl.id;
    idUser = existingShortUrl.user_id;

    await connection.query(`INSERT INTO views ("link_id") VALUES ($1);`, [
      idUrl,
    ]);

    link = existingShortUrl.link_url;
    console.log(link);
    return res.redirect(link);
  } catch (err) {
    console.error(err);
    return res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export async function deleteLink(req, res) {
  const { id } = req.params;
  const { idUser } = res.locals;

  try {
    const existingIdLink = (
      await connection.query(`SELECT * FROM links WHERE id=$1;`, [id])
    ).rows[0];

    if (!existingIdLink) {
      return res.sendStatus(STATUS_CODE.NOT_FOUND);
    }

    if (existingIdLink.user_id !== idUser) {
      return res.sendStatus(STATUS_CODE.UNAUTHORIZED);
    }

    await connection.query(`DELETE FROM views WHERE "link_id"=$1;`, [id]);
    await connection.query(`DELETE FROM links WHERE id=$1;`, [id]);

    return res.sendStatus(STATUS_CODE.NO_CONTENT);
  } catch (err) {
    console.error(err);
    return res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}
