# Test PostgreSQL com Robot

PostgreSQL

https://hub.docker.com/_/postgres

## Baixar a imagem

```bash
docker pull postgres
```

## Executar

```bash
docker run --rm --name postgres -e POSTGRES_USER=db_user -e POSTGRES_PASSWORD=pass -e POSTGRES_DB=db -p 5432:5432 -d postgres
```