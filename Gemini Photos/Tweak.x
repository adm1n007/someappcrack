#import <Foundation/Foundation.h>

%ctor {
    @autoreleasepool {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(0.5 * NSEC_PER_SEC)),dispatch_get_main_queue(),^{
            [NSUserDefaults.standardUserDefaults setBool:true forKey:@"activatedBySetappKey"];
        });
    }
}
