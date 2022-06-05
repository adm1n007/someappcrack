#include "ASMSearchWithCallback.h"

static int (*orig_int)(void);
static int hook_int(void) {
    return 2;
}

static void callback(size_t i, cs_insn *ci) {
    MSHookFunction((void *)(_dyld_get_image_vmaddr_slide(0) + 0x100000000 + ci[i].address), (void *)hook_int, (void **)&orig_int);
}

%ctor {
    const char *const myinstrs[] = {
        "sub", "stp", "stp", "stp",
        "stp", "add", "mov", "adrp",
        "ldr", "add", "ldp", "ldr",
        "ldr", "mov", "bl", "mov",
        "bl", "mov", "bl", "add",
        "blr", "ldrb", "mov", "bl"
    };
    const char *const myopstrs[] = {
        "sp, sp, #0x60", "x24, x23", "x22, x21", "x20, x19",
        "x29, x30", "x29, sp, #0x50", "x19, x20", "x8",
        "x8", "x8, x20, x8", "x23, x20, [x8]", "x21",
        "x22", "x0, x20", "bl", "x0, x21",
        "bl", "x0, x22", "bl", "x8, sp, #0x18",
        "x23", "w23", "x0, x22", "bl"
    };
    ASMSearchWithCallback(NULL, (uint32_t)0x1000A0000, 0x50000, 24, myinstrs, myopstrs, &callback);
}
