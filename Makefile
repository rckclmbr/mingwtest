all:
	CGO_ENABLED=1 GOOS=windows GOARCH=386 CC_FOR_TARGET="i586-mingw32msvc-gcc" PKG_CONFIG_PATH=$(pwd) go build -o test.exe .
