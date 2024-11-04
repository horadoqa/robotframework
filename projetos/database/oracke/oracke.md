# Test Oracle com Robot 

https://github.com/gvenzl/oci-oracle-free
https://hub.docker.com/r/gvenzl/oracle-free

## Baixar a imagem

```bash
docker pull gvenzl/oracle-free
```

## Executar

```bash
docker run --rm --name oracle -d -p 1521:1521 -e ORACLE_PASSWORD=pass -e ORACLE_DATABASE=db -e APP_USER=db_user -e APP_USER_PASSWORD=pass gvenzl/oracle-free
```