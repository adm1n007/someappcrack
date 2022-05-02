#import <Foundation/Foundation.h>

#include <substrate.h>

static int (*orig_int)(void);
static int hook_int(void) {
    return 1;
}

%ctor {
    @autoreleasepool {
        MSHookFunction((void *)MSFindSymbol(MSGetImageByName([NSString stringWithFormat:@"%@/Frameworks/MomentoKit.framework/MomentoKit", NSBundle.mainBundle.bundlePath].UTF8String), "_$s10MomentoKit0A7ManagerC9isProUserSbvgZ"), (void *)hook_int, (void **)&orig_int);
    }
}
