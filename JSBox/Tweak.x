#include <substrate.h>

%hook BLKBundleAssetsStates
- (bool)assetIsEnabledForExtension:(NSUInteger)arg1 {
    return true;
}

- (bool)extensionBundleAvailable {
    return true;
}

- (bool)availableForExtensions {
    return true;
}

- (double)expireTimestamp {
    return 4078176847.0f;
}

- (bool)assetsWarmup {
    return true;
}

- (bool)extraAssets {
    return true;
}
%end
%hook BLKRuntimeVariables
- (bool)disablesFlags {
    return true;
}
%end

static bool (*orig_id)(void);
static bool new_id(void) {
    return false;
}

%ctor {
    @autoreleasepool {
        // 屏蔽越狱
        MSHookFunction((void *)MSFindSymbol(MSGetImageByName([NSString stringWithFormat:@"%@/Frameworks/JSBoxKit.framework/JSBoxKit", NSBundle.mainBundle.bundlePath].UTF8String), "_illegal_device"), (void *)new_id, (void **)&orig_id);
        // 破解
        %init;
    }
}
