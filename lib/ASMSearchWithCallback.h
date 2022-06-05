#import <Foundation/Foundation.h>

#include <mach-o/getsect.h>
#include <mach-o/dyld.h>
#include <substrate.h>

#define INCBIN_SILENCE_BITCODE_WARNING

#include "capstone/capstone.h"
#include "incbin.h"

INCBIN(capstoneLicense, "capstone/LICENSE");

// My Github: https://github.com/NeHyci
// This is a function that search assembly code in a specified range to do something, based on Capstone.
// 基于capstone反汇编框架
// 仅供学习交流使用，勿用于违法行为

void ASMSearchWithCallback(const struct mach_header_64 *header, const uint32_t offset, const uint32_t size, const uint32_t count, const char *const instrs[], const char *const opstrs[], void (*callback)(size_t, cs_insn *)) {
    csh cs_handle = 0;
    cs_insn *ci = NULL;
    size_t dc = 0;

    cs_err cserr = cs_open(CS_ARCH_ARM64, CS_MODE_ARM, &cs_handle);
    NSCAssert(cserr == CS_ERR_OK, @"Capstone initialization failed");

    cs_option(cs_handle, CS_OPT_MODE, CS_MODE_ARM);
    cs_option(cs_handle, CS_OPT_SKIPDATA, CS_OPT_ON);

    if (!header) header = (const struct mach_header_64 *)_dyld_get_image_header(0);

    dc = cs_disasm(cs_handle, (const uint8_t *)((intptr_t)header + offset), size, offset, 0, &ci);
    for (size_t i = 0; i < dc; i++) {
        uint32_t index = 0;
        for (uint32_t j = 0; j < count; j++) {
            char buffer[66];
            sprintf(buffer, "%-10s\t%s\n", ci[i+j].mnemonic, ci[i+j].op_str);
            if (strstr(buffer, instrs[j]) && strstr(buffer, opstrs[j])) index++;
            else index = 0;
        }
        if (index == count) {
            index = 0;
            callback(i, ci);
        }
    }
    cs_free(ci, dc);
    cs_close(&cs_handle);
}
