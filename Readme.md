

# Viver de Teste 2.ª Temporada

<h1 align="left">
    <img src=".github/logo-stiker.svg" width="250px">
</h1>


# Trade Sticker

## 🔖 Requisitos funcionais

### Slogan (slogan.robot)

- [X] Deve validar o slogan da home page [tag: slogan]

### Login (login.robot)

- [X] Deve logar usando email e senha válidos [tag: login_success]
- [X] Não deve logar usando email inválido e senha válida [tag: inv_email]
- [X] Não deve logar usando email válido e senha inválida [tag: inv_pass]
- [X] Não deve logar usando somente senha válida [tag: no_email]
- [X] Não deve logar usando somente email válido [tag: no_pass]
- [X] Não deve logar sem inserir email e senha [tag: no_email_pass]

| campos | descrição                             | tipo     | obrigatório |
| ------ | :------------------------------------ | -------- | ----------- |
| email   | email do usuário                     | texto    | sim         |
| senha   | senha do usuário                     | texto    | sim         |
| checkbox  | Checkbox Lembrar Dados             | checkbox | não         |

### Busca de Figurinhas (search_sticker.robot)

- [X] Deve retornar uma lista de usuários e suas figurinhas [tag: no_sticker]
- [X] Deve retornar os usuários que possuem uma figurinha específica [tag: sticker]
- [X] Deve retornar página de erro ao buscar figurinha não cadastrada [tag: inv_sticker]

| campos  | descrição                             | tipo     | obrigatório |
| ------  | :------------------------------------ | -------- | ----------- |
| textbox | Caixa de pesquisa                     | texto    | não         |

### Negociação de Figurinhas (trade_sticker.robot)

- [X] Deve poder negociar uma firurinha específica com um usuário [tag: trade_sticker]

## 🚀 Tecnologias

- [Robot] - framework de testes automatizados

## 👨🏻‍💻 Como executar o projeto

[Node.js](https://nodejs.org/) v16 ou superior para executar.
[Python](https://www.python.org/downloads/) 3.1.7 ou superior para executar.

Execute os comandos abaixo para instalar das dependências do projeto e execução dos testes:

```sh
pip instal robot framework
cd trade-sticker
robot -d ./logs/ tests/ 
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feito com 💜 &nbsp;por Fernando Papito 👋 &nbsp;[Meu linkedin](https://www.linkedin.com/in/papitoio/)
