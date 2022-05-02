#import <Foundation/Foundation.h>

%hook NSUserDefaults
- (BOOL)boolForKey:(id)key {
    if ([key containsString:@"subscrib"]) {
        return YES;
    }
    return %orig;
}
%end
