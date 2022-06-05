#import <Foundation/Foundation.h>

%hook NSUserDefaults
- (BOOL)boolForKey:(id)key {
    if ([key isEqualToString:@"AEDefaultsHasPremiumLicense"]
      || [key containsString:@"IsProPurchased"]) return YES;
    return %orig;
}
- (id)objectForKey:(id)key {
    if ([key isEqualToString:@"AEDefaultsPremiumExpirationDate"]) return NSDate.distantFuture;
    return %orig;
}
%end
