# NodeJS Docker Image 
Default nodejs image used by appcom interactive.


## Usage

This image is intended to be used as base for an nodejs project.

The nodejs app needs to be copied into the /node folder inside the container.
The file package.json needs to be in /node/package.json.

Normally there would be a Dockerfile and a .dockerignore file inside the project.

The Dockerfile should look like:

```
FROM appcom/nodejs

# install dependencies (node_modules) and copy into /node
# we install the node modules this way to benefit from the docker caching and only need to rebuild if package.json 
# changes
ADD package.json /tmp/package.json
RUN cd /tmp \
  && npm install --only=production \
  && mv /tmp/node_modules /node/node_modules \
  && rm -rf /tmp/npm-*

COPY . /node
```

The .dockerignore file should list all files that should't be copied into the image and look like:

```
.editorconfig
.git
.gitignore
Dockerfile
docker-compose.yml
node_modules
```

## Docker Tags

There are the following tags and corresponding versions.

### Alpine based images

- appcom/nodejs - NodeJS 9 with NPM 5 (Current)
- appcom/nodejs:9 - NodeJS 9 and NPM 5
- appcom/nodejs:8 - NodeJS 8 and NPM 5
- appcom/nodejs:7 - NodeJS 7 and NPM 4 (no longer supported)
- appcom/nodejs:lts - NodeJS 8 and NPM 5 (LTS)
- appcom/nodejs:6 - NodeJS 6 and NPM 3 (no longer supported)

### Debian based images

- appcom/nodejs:debian-9 - NodeJS 9
- appcom/nodejs:debian-10 - NodeJS 10

## Known Issues

- Currenlty only production dependecies are installed. This prevents running tests that use devDependencies.
  - Workaround: create a npm script that installs the devDependencies first like: npm install && npm run test

## LICENSE

The MIT License (MIT)

Copyright (c) 2017-2018 appcom interactive GmbH. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

