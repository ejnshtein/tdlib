# ejnshtein/tdlib

Docker image with tdlib inside.
Binaries are located in `/usr/local/lib/`. (example: `/usr/local/lib/libtdjson.so`)

## Usage
Inside you dockerfile add `FROM` entry as follows:
```docker
FROM ejnshtein/tdlib:latest as tdlib
```
And after `WORKDIR` command:
```docker
COPY --from=tdlib /usr/local/lib/libtdjson.so .
```
This will copy binary from this image to your project.