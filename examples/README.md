# Examples

These are some example uses of bash-templater

## Simple example

Lets say you have a directory called `nginx` that looks like this

```
nginx
├── .env
├── nginx.yaml
└── nginx.yaml.tmpl
```

``` yaml

# nginx.yaml.tmpl
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx-{{ENVIRONMENT}}
  namespace: {{ENVIRONMENT}}
spec:
  replicas: 2
  selector:
    app: nginx-{{ENVIRONMENT}}
  template:
    metadata:
      name: nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:{{IMAGE_TAG}}
        ports:
        - containerPort: {{LISTEN_PORT}}
```

and if your .env file looks like this

``` bash
# .env
ENVIRONMENT=staging
IMAGE_TAG=alpine
LISTEN_PORT=80
```

Then running the command

`$ templater nginx.yaml.tmpl > nginx.yaml`

will give you an nginx.yaml file like this 

``` yaml
# nginx.yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx-staging
  namespace: staging
spec:
  replicas: 2
  selector:
    app: nginx-staging
  template:
    metadata:
      name: nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:alpine
        ports:
        - containerPort: 80
```

and your new tree looks like this

```
nginx
├── .env
├── nginx.yaml
└── nginx.yaml.tmpl
```

