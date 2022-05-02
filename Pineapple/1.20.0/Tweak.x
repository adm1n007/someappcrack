#include <mach-o/dyld.h>
#include <substrate.h>

static int (*orig_int)(void);
static int hook_int(void) {
    return 1;
}

%ctor {
    MSHookFunction((void *)(_dyld_get_image_vmaddr_slide(0) + 0x10001482C), (void *)hook_int, (void **)&orig_int);
}
