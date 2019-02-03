# Demo App

This is the dockerized version of kepler.gl demo app. This app shows kepler.gl as a single page app, loading sample maps from remote url, saving map data to dropbox. This is also the source code of kepler.gl/#/demo.

## Build

```bash
docker build -t asatrya/kepler-demo .
```

## Run

```bash
docker run --rm --name kepler-demo -p 8080:80 -d asatrya/kepler-demo

# Optional: pass your mapbox access token to the container
docker run --rm --name kepler-demo -p 8080:80 -e MapboxAccessToken="yourMapboxToken" -d asatrya/kepler-demo
docker run --rm --name kepler-demo -p 8080:80 -e MapboxAccessToken="pk.eyJ1IjoiYXNhdHJ5YSIsImEiOiJjanA5bTN3anYwYnd6M3BwZDB2NGQ3NG56In0.eEPeHaxL1DyBN_uV6X5c-g" -d asatrya/kepler-demo
```

## Access Interactively

```
docker exec -it kepler-demo bash
```

Some modules need to be build at startup. Therefore, it will a take a minute until the container is ready to use
at [http://localhost:8080](http://localhost:8080).