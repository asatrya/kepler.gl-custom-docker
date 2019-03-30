# Dockerized & Customized Kepler.gl

This is the dockerized and customized version of kepler.gl app. This app shows kepler.gl as a single page app, loading sample maps for the results of Pileg 2014 & Pilgub 2018 in Kota Bandung.

## Add Mapbox Access Token

Add your mapbox access token in `.env` file:

```
MapboxAccessToken=put-your-token-here
```

## Configure Maps URL

You can configure the URL containing JSON file that define the list of preloaded maps in `src/constants/default-settings.js` line 30 by changing `MAP_CONFIG_URL` variable value.

```js
export const MAP_CONFIG_URL = `https://raw.githubusercontent.com/asatrya/kepler.gl-custom-docker/master/src/data/preloaded-data.json?nocache=${(new Date()).getTime()}`;
```

That file defines the list of maps when you select to load the *Preloaded Data* option from *Add Data* dialog.

## Load Map on Initialization

Kepler.gl can load map from the start so that you don't have to load file manually.

To do that, here is the step: 

1. Import map and config file by uncomment the sample lines (`src/app.js` line 45-46):

	```js
	import dataGeojson from './data/sample-data.json';
	import configJson from './data/sample-config.json';
	```

1. uncomment `src/app.js` line 121

	```js
	this._loadSampleData();
	```

Of course you can change the map and config file as your requirements.

## Build & Run Container

Run this command from the root project folder

```bash
$ docker-compose up -d
```

Some modules need to be build at startup. Therefore, it will a take a minute until the container is ready to use
at [http://localhost:8080](http://localhost:8080).

## References

https://github.com/uber-common/vis-academy/tree/master/src/docs/kepler.gl