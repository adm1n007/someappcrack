#include <substrate.h>

static int (*orig_int)(void);
static int hook_int(void) {
    return 1;
}

%ctor {
    // v3.2.4
    MSHookFunction((void *)(_dyld_get_image_vmaddr_slide(0) + 0x1001C548C), (void *)hook_int, (void **)&orig_int);
}
