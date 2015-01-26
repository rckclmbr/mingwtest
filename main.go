package main

/*
#cgo pkg-config: libspotify
#include <libspotify/api.h>
*/
import "C"
import "fmt"

func main() {
    err := C.sp_error(C.SP_ERROR_BAD_API_VERSION)
    fmt.Printf("Spotify error: %s\n", C.sp_error_message(err));
}
