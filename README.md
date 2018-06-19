# Amber Framework Website

Official website for Amber web application framework. 

## Installation

Create a PG database called `demo` and configure the `config/database.yml`
to provide the credentials to access the table.

Then:

```sh
shards install
amber migrate up
```

## Usage

To run the demo:

```sh
crystal build src/amberframework.cr
./amberframework
```

## Front-end capabilities

Amber framework includes a minimal configuration to generate `main.bundle.js` and `main.bundle.css` using SCSS and JavaScript.

On development use:

```sh
npm install
npm run watch
```

To generate minified bundles for production execute:

```sh
npm install
npm run release
```

## Docker and Docker Compose

This will start an instance of postgres, migrate the database, run the specs,
and launch the site at http://localhost:3000

```sh
docker-compose up -d
```

To view the logs:

```sh
docker-compose logs -f
```

Note: The Docker images are compatible with Heroku.  

## SystemD Service

> NOTE: root permission is required by some `systemctl` commands.

### iptables.service

Copy  `iptables.service` to `/etc/systemd/system` and enable it using `systemctl enable iptables.service`

The `iptables` service redirects port `80` to port `8080`. This setting allows to use port 80 without root.

> NOTE: Use `sudo iptables -t nat -D PREROUTING 1` to delete redirect **only** if required

### amberframework.service

Open the file `amberframework.service` and edit these variables:

```
User=your-user
WorkingDirectory=/your/project/path/
ExecStart=/your/project/path/bin/executable
```

Then copy this file to `/etc/systemd/system` and reboot your machine or use `systemctl daemon-reload` to reload systemd services.

### Service usage

To start `amberframework` service use:

> NOTE: start is done automatically at system boot.

```
systemctl start amberframework
```

To stop `amberframework` service use:

```
systemctl stop amberframework
```

To see `amberframework` service status use:

```
systemctl status amberframework
```

To see `amberframework` service logs use:

```
journalctl -u amberframework
```

## Contributing

1. Fork it ( https://github.com/amberframework/amberframework.org/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [amberframework](https://github.com/amberframework) Amber Framework Organization - creator, maintainer
