%hook NSUserDefaults
- (BOOL)boolForKey:(NSString *)key {
    if ([key isEqualToString:@"isProUser"]) {
        return YES;
    }
    return %orig;
}
%end
