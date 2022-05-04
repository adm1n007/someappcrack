#include <substrate.h>

#ifdef __cplusplus
extern "C" {
#endif
void MSHookMemory(void *target, const void *data, size_t size);
#ifdef __cplusplus
}
#endif

static const uint8_t nop[] = {
    0x1F, 0x20, 0x03, 0xD5
};

%ctor {
    MSHookMemory((void *)(MSFindSymbol(NULL, "_$s4Pyto13SceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0I7SessionCSo0I17ConnectionOptionsCtF") + 48), (void *)nop, sizeof(nop));
}
