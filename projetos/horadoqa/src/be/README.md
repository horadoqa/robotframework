# BE

Instale o Node.js e MongoDB:

Certifique-se de que você tenha o Node.js e o MongoDB instalados em sua máquina.

Crie um novo projeto Node.js:

```bash
mkdir be
cd be
npm init -y
```

Instale as dependências:

MongoDB

wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb.gpg

apt-key list

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list


sudo apt update
sudo apt-get install -y mongodb-mongosh
mongosh

Current Mongosh Log ID: 66f28fcb0c5c127a43964032
Connecting to:          mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.3.1
MongoNetworkError: connect ECONNREFUSED 127.0.0.1:27017

sudo systemctl start mongosh
sudo systemctl enable mongosh
sudo systemctl status mongod

Firewall
Verifique se há algum firewall bloqueando a porta 27017. Você pode usar o ufw (se estiver disponível) para permitir o tráfego nessa porta:

sudo ufw allow 27017


```bash
npm install express mongoose body-parser cors
```

Estrutura do Projeto: Crie os seguintes arquivos e pastas:

be/
├── server.js
└── models/
    └── User.js

Configuração do Mongoose (models/User.js): 

Crie um modelo para armazenar os dados do usuário:

```bash
const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    name: String,
    email: String,
    phone: String,
    country: String,
    framework: String,
    comments: String
});
```

Criação do Servidor Express (server.js): Configure seu servidor para aceitar requisições:

```bash
const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require('cors');
const User = require('./models/User');

const app = express();
const PORT = process.env.PORT || 5000;

// Conexão com MongoDB
mongoose.connect('mongodb://localhost:27017/meu-banco', {
    useNewUrlParser: true,
    useUnifiedTopology: true
});

app.use(cors());
app.use(bodyParser.json());

// Rota para salvar o usuário
app.post('/api/users', async (req, res) => {
    const { name, email, phone, country, framework, comments } = req.body;
    const newUser = new User({ name, email, phone, country, framework, comments });

    try {
        await newUser.save();
        res.status(201).send('Usuário salvo com sucesso!');
    } catch (error) {
        res.status(500).send('Erro ao salvar o usuário: ' + error.message);
    }
});

app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
```

Altere seu formulário HTML para fazer uma requisição para o backend:

```bash
document.addEventListener('DOMContentLoaded', function() {
    console.log("Script carregado!");

    document.getElementById('submitButton').addEventListener('click', async function(event) {
        event.preventDefault();

        console.log("Botão acionado !!!");
        this.textContent = 'Enviado';
        this.disabled = true;

        // Coleta os dados do formulário
        const userData = {
            name: document.getElementById('name').value,
            email: document.getElementById('email').value,
            phone: document.getElementById('phone').value,
            country: document.getElementById('country').value,
            framework: document.getElementById('select-itens').value,
            comments: document.getElementById('area').value
        };

        // Envia os dados para o backend
        try {
            const response = await fetch('http://localhost:5000/api/users', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(userData)
            });

            if (response.ok) {
                console.log('Dados salvos com sucesso!');
                window.location.href = "/src/fe/obrigado.html"; // Redireciona após salvar
            } else {
                console.error('Erro ao salvar dados');
            }
        } catch (error) {
            console.error('Erro na requisição:', error);
        }
    });
});


```
Executando o Projeto
Inicie o MongoDB:

mongod

Inicie o servidor Node.js:

node server.js