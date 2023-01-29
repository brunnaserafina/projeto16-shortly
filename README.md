<h1 align="left">ShortLy API 🩳</h1>

###

<p align="left">Esta é uma API (Application Programming Interface) encurtadora de URL's. Acesse também o front-end da aplicação feito por mim https://github.com/brunnaserafina/shortly </p>

###

### ⚙️ Funcionalidades

- Cadastro
- Login
- Encurtar URL
- Redirecionar o usuário para o link correspondente
- Contar o número de visitas
- Deletar um link encurtado
- Retornar todos os links do usuário
- Obter ranking com os links encurtados mais visualizados

</br>

### 📄 Documentação da API

##### CADASTRO:

```http
  POST /sign-up
```
- Body:

| Parâmetro        | Tipo     | Descrição                           |
| :--------------- | :------- | :-----------------------------------|
| `name`           | `string` | `Nome do usuário`                   |
| `email`          | `string` | `E-mail do usuário`                 |
| `password`       | `string` | `Senha do usuário`                  |
| `confirmPassword`| `string` | `Repetição de senha para confirmar` |

--
##### LOGIN:

```http
  POST /sign-in
```
- Body:

| Parâmetro  | Tipo     | Descrição           |
| :--------- | :------- | :-------------------|
| `email`    | `string` | `E-mail do usuário` |
| `password` | `string` | `Senha do usuário`  |

--

##### ENCURTAR URL:

```http
  POST /urls/shorten
```

- Body:

| Parâmetro  | Tipo     | Descrição                  |
| :--------- | :------- | :--------------------------|
| `url`      | `string` | `Link que deseja encurtar` |

- Headers:

| Parâmetro      | Tipo     | Descrição         |
| :--------------| :------- | :-----------------|
| `Authorization`| `string` | `Bearer ${token}` |

--

##### OBTER DADOS DA URL:

```http
  GET /urls/${ID_DA_URL}
```

--

##### REDIRECIONAR PARA LINK:

```http
  GET /urls/open/${URL_ENCURTADA}
```

--

##### DELETAR URL:

```http
  DELETE /urls/${ID_DA_URL_A_SER_DELETADA}
```

- Headers:

| Parâmetro      | Tipo     | Descrição         |
| :--------------| :------- | :-----------------|
| `Authorization`| `string` | `Bearer ${token}` |

--

##### OBTER DADOS DA CONTA DO USUÁRIO:
  (quantidade total de visitas e links do usuário)

```http
  GET /users/me
```

- Headers:

| Parâmetro      | Tipo     | Descrição         |
| :--------------| :------- | :-----------------|
| `Authorization`| `string` | `Bearer ${token}` |

--

##### OBTER RANKING

```http
  GET /ranking
```

--

</br>

### ▶️ Rodando a aplicação

1. Crie ou selecione uma pasta com o nome de sua preferência
2. Clone este repositório na pasta criada/selecionada:

```bash
 $ git clone https://github.com/brunnaserafina/shortly-api.git
```
3. Instale suas depêndencias:

```bash
   npm i
```

4. Inicie a aplicação na raíz do projeto:

```bash
   npx nodemon src/server.js
```

</br>

### 🛠️ Tecnologias utilizadas

 <img align="left" alt="node" height="30px" src="https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white" />
 <img align="left" alt="express" height="30px" src="https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB" />

 <img align="left" alt="postgresql" height="30px" src="https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white" />
 <img align="left" alt="mongodb" height="30px" src="https://img.shields.io/badge/bcrypt-%20-green" />
 <img align="left" alt="cors" height="30px" src="https://img.shields.io/badge/cors-%20-red" />
 <img align="left" alt="cors" height="30px" src="https://img.shields.io/badge/day-JS%20-orange" />
 <img align="left" alt="cors" height="30px" src="https://img.shields.io/badge/uuid-%20-brightgreen" />
 


</br>
</br>

### 🙇🏻‍♀️ Autora

- Feito com ❤️ por [@brunnaserafina](https://www.github.com/brunnaserafina)

