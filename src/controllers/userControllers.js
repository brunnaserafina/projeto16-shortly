import connection from "../databases/pgsql.js";
import { STATUS_CODE } from "../enums/statusCode.js";

export async function getUser(req, res) {
  const { idUser } = res.locals;

  try {
    const user = (
      await connection.query(`SELECT * FROM users WHERE id=$1;`, [idUser])
    ).rows[0];

    if (!user) {
      return res.sendStatus(STATUS_CODE.NOT_FOUND);
    }

    const visitCountTotal = (
      await connection.query(
        `
            SELECT SUM("visit_count") 
            FROM views 
            JOIN links 
                ON views."link_id" = links.id 
            WHERE "user_id"=$1 
            GROUP BY links."user_id";
        `,
        [idUser]
      )
    ).rows[0];

    const shortened = await connection.query(
      `
            SELECT 
                links.id, 
                links.short_url AS "shortUrl", 
                links.link_url AS "linkUrl", 
                SUM("visit_count") AS "visitCount"
            FROM views
            JOIN links
                ON views."link_id" = links.id
            WHERE links."user_id"=($1)
            GROUP BY links.id;
        `,
      [idUser]
    );

    const infoUser = {
      id: idUser,
      name: user.name,
      visitCount: visitCountTotal.sum,
      shortenedUrls: shortened.rows,
    };

    return res.status(STATUS_CODE.OK).send(infoUser);
  } catch (err) {
    console.error(err);
    return res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}
