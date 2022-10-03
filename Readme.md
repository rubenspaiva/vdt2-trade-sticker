

# Viver de Teste 2.ª Temporada

<h1 align="left">
    <img src="https://github.com/rubenspaiva/vdt-season1-marvel-api/blob/main/.github/logo-stiker.svg" width="250px">
</h1>


# Trade Sticker

## 🔖 Requisitos funcionais

### Slogan (slogan.robot)

- [X] Deve validar o slogan da home page [tag: slogan]

### Login (login.robot)

- [X] Não deve logar sem inserir email e senha [tag: no_email_pass]
- [X] Não deve logar usando somente email [tag: no_pass]
- [X] Não deve logar usando somente senha [tag: no_email]
- [X] Não deve logar usando email inválido e senha válida [tag: inv_email]
- [X] Não deve logar usando email válido e senha inválida [tag: inv_pass]
- [X] Deve logar usando email e senha válidos [tag: login_success]

| campos  | descrição                             | tipo     | obrigatório |
| ------  | :------------------------------------ | -------- | ----------- |
| email   | email do usuário                      | texto    | sim         |
| senha   | senha do usuário                      | texto    | sim         |
| checkbox| checkbox lembrar dados                | checkbox | não         |

### Busca de Figurinhas (search_sticker.robot)

- [X] Deve retornar uma lista de usuários e suas figurinhas [tag: no_sticker]
- [X] Deve retornar os usuários que possuem uma figurinha específica [tag: sticker]
- [X] Deve retornar página de erro ao buscar figurinha não cadastrada [tag: inv_sticker]

| campos  | descrição                             | tipo     | obrigatório |
| ------  | :------------------------------------ | -------- | ----------- |
| textbox | caixa de pesquisa                     | texto    | não         |

### Negociação de Figurinhas (trade_sticker.robot)

- [X] Deve poder negociar com um usuário [tag: trade_user]
- [X] Deve poder negociar uma figurinha específica com um usuário [tag: trade_sticker]

## 🚀 Tecnologias

- [Robot] - framework de testes automatizados

## 👨🏻‍💻 Como executar o projeto

[Node.js](https://nodejs.org/) v16 ou superior para executar.

[Python](https://www.python.org/downloads/) 3.1.7 ou superior para executar.

Execute os comandos abaixo para instalar das dependências do projeto e execução dos testes:

```sh
pip install robot framework
pip install robotframework-browser
rfbrowser init
cd trade-sticker
robot -d ./logs/ tests/ 
```

## 📝 Sugestões de Melhorias

Segue documento no drive mostrando algumas sugestões de melhorias: [Documento de Melhorias](https://docs.google.com/document/d/1En2Gn2OC3t3Em0N2W7ztmQnsxbUjddfir8wAjmeFwps/edit#)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Layout feito com 💜&nbsp;por [Fernando Papito](https://www.linkedin.com/in/papitoio/) 👋&nbsp;e adaptado por [Rubens Paiva](https://www.linkedin.com/in/papitoio/)