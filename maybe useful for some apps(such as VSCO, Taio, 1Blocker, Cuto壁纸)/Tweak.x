#import <Foundation/Foundation.h>

%hook RCEntitlementInfos
- (id)objectForKeyedSubscript:(id)arg1 {
    return [[NSClassFromString(@"RCEntitlementInfo") alloc] init];
}
%end
%hook RCEntitlementInfo
- (bool)isActive {
    return true;
}
%end
