#include <stdio.h>
#include <libspotify/api.h>

int main() {
    const char* error_message = sp_error_message(SP_ERROR_BAD_API_VERSION);
    printf("Success: %s\n", strcmp(error_message, "Invalid library version") == 0
                                ? "true" : "false");
    return 0;
}
