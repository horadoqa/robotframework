# K8S

## Instalando o K3D

```bash
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
```

## Criando o cluster

```bash
k3d cluster create horadoqa
```

kubectl apply -f deployment.yaml 
    deployment.apps/backend created
    service/backend created

kubectl get deployments
    NAME      READY   UP-TO-DATE   AVAILABLE   AGE
    backend   1/1     1            1           56s

kubectl get pods
    NAME                       READY   STATUS    RESTARTS   AGE
    backend-5f79486497-bfm9k   1/1     Running   0          14s
    mongo-76f46d696c-bgh85     1/1     Running   0          7m58s

kubectl logs backend-5f79486497-bfm9k
    Servidor rodando na porta 5000
    Conectado ao MongoDB

kubectl port-forward service/backend 5000:5000

    Forwarding from 127.0.0.1:5000 -> 5000
    Forwarding from [::1]:5000 -> 5000

## Verificar o Service

Para verificar se seu Service foi criado corretamente:

kubectl get services
    NAME         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
    backend      ClusterIP   10.43.118.40   <none>        5000/TCP   3m44s
    kubernetes   ClusterIP   10.43.0.1      <none>        443/TCP    28m