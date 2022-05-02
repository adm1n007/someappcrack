#include <mach-o/dyld.h>
#include <substrate.h>

#ifdef __cplusplus
extern "C" {
#endif
void MSHookMemory(void *target, const void *data, size_t size);
#ifdef __cplusplus
}
#endif

static const uint8_t mov_x0_0[] = {
    0x00, 0x00, 0x80, 0xD2
};
static const uint8_t mov_x0_1[] = {
    0x20, 0x00, 0x80, 0xD2
};
static const uint8_t mov_x0_2[] = {
    0x48, 0x00, 0x80, 0xD2
};
static const uint8_t nop[] = {
    0x1F, 0x20, 0x03, 0xD5
};

%ctor {
    // 破解高级版
    void *funcstart = MSFindSymbol(NULL, "_$s7Termius22BulkAccountInfoAdapterCAA0cD8ProtocolA2aDP5isProSbvgTW");
    MSHookMemory(funcstart, (void *)mov_x0_1, sizeof(mov_x0_1));
    MSHookMemory((void *)(funcstart + 0x4), (void *)nop, sizeof(nop));
    // 移除左下角的试用
    MSHookMemory((void *)(MSFindSymbol(NULL, "_$s7Termius31MenuFooterPromoViewModelFactoryC04viewF011accountTypeAA0bcdeF0CSgAA07AccountJ0O_tFZTf4nd_n") + 16), (void *)mov_x0_2, sizeof(mov_x0_2));
    // 屏蔽越狱检测
    MSHookMemory((void *)(MSFindSymbol(NULL, "_$s16IOSSecuritySuiteAAC28amIJailbrokenWithFailMessageSb10jailbroken_SS04failG0tyFZ") + 56), (void *)mov_x0_0, sizeof(mov_x0_0));
}
