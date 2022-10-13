import signUpSchema from "../schemas/signUpSchema.js";
import { STATUS_CODE } from "../enums/statusCode.js";

export async function signUpValidate(req, res, next) {
  const { name, email, password, confirmPassword } = req.body;

  const validate = signUpSchema.validate(
    { name, email, password, confirmPassword },
    { abortEarly: false }
  );

  if (validate.error) {
    const err = validate.error.details.map((detail) => detail.message);
    return res.status(STATUS_CODE.UNPROCESSABLE_ENTITY).send({ message: err });
  }

  res.locals = { name, email, password };

  next();
}
