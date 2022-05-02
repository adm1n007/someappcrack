#import <Foundation/Foundation.h>

%group iPad
%hook _TtC8LrMobile18LMLicensingManager
+ (bool)isProfileStatusAvailable {
    return true;
}
%end
%end
%group iPhone
%hook _TtC13LrMobilePhone18LMLicensingManager
+ (bool)isProfileStatusAvailable {
    return true;
}
%end
%end
%ctor {
    @autoreleasepool {
        NSString *processName = NSProcessInfo.processInfo.processName;
        if ([processName isEqualToString:@"LrMobile"]) {
            %init(iPad);
        }
        else if ([processName isEqualToString:@"LrMobilePhone"]) {
            %init(iPhone);
        }
        else {
            return;
        }
    }
}
