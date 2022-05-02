#include <mach-o/dyld.h>

#ifdef __cplusplus
extern "C" {
#endif
void MSHookMemory(void *target, const void *data, size_t size);
#ifdef __cplusplus
}
#endif

static const uint8_t mov_x0_3[] = {
    0x60, 0x00, 0x80, 0xD2
};
static const uint8_t ret[] = {
    0xC0, 0x03, 0x5F, 0xD6
};

%ctor {
    intptr_t funcstubstart = _dyld_get_image_vmaddr_slide(0) + 0x1003A9C14;
    MSHookMemory((void *)funcstubstart, (void *)mov_x0_3, sizeof(mov_x0_3));
    MSHookMemory((void *)(funcstubstart + 4), (void *)ret, sizeof(ret));
}
