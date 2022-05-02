#include <mach-o/dyld.h>
#include <substrate.h>

static int (*orig_int)(void);
static int hook_int(void) {
    return 1;
}

%ctor {
    // v3.2.2 and v3.2.3
    MSHookFunction((void *)(_dyld_get_image_vmaddr_slide(0) + 0x1001CD9E0), (void *)hook_int, (void **)&orig_int);
}
