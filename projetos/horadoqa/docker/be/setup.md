# DOCKER

## Construir a Imagem Docker

```bash
docker build -t be:v1.0.0 .
docker push horadoqa/be:v1.0.0 .
```

## Listar as imagens

```bash
docker images
```

## Executando a imagem

```bash
docker run -p 5000:5000 be:v1.0.0
```

## Verificar Contêineres em Execução

```bash
docker ps
```

Parar ou Remover Contêineres em Execução

```bash
docker stop <container_id>
```

```bash
docker rm <container_id>
```

Verificar Serviços do Sistema

```bash
sudo lsof -i :5000
```

## Enviando a imagem para o DOCKERHUB

```bash
docker push horadoqa/backend:v1.0.0
```
