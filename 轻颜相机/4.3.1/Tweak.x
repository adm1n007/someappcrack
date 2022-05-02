#include <mach-o/dyld.h>
#include <substrate.h>

static int (*orig_int)(int, int ,int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int);
static int hook_int(int arg1, int arg2,int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11, int arg12, int arg13, int arg14, int arg15, int arg16, int arg17, int arg18) {
    return 1;
}

%ctor {
    MSHookFunction((void *)(_dyld_get_image_vmaddr_slide(0) + 0x103140040), (void *)hook_int, (void **)&orig_int);
}
