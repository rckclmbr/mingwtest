FROM golang:1.4-cross

RUN apt-get update; \
    apt-get install -y --force-yes mingw-w64 pkg-config unzip curl

# Install libspotify for win32
RUN mkdir -p /libspotify; \
    curl -s "https://developer.spotify.com/download/libspotify/libspotify-12.1.51-win32-release.zip" > libspotify.zip; \
    unzip -d /libspotify/ libspotify.zip
ADD libspotify.pc /usr/local/lib/pkgconfig-mingw/libspotify.pc

ENV CGO_ENABLED=1
ENV GOOS=windows
ENV GOARCH=386
ENV CC_FOR_TARGET="i686-w64-mingw32-gcc"
ENV PKG_CONFIG_PATH=/usr/local/lib/pkgconfig-mingw/
ENV GOPATH=/opt/go

RUN cd /usr/src/go/src; ./make.bash --no-clean 2>&1

ENV CC="i686-w64-mingw32-gcc"
