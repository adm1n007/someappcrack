#import <Foundation/Foundation.h>

#include <objc/runtime.h>

%hook BZRReceiptSubscriptionInfo
- (id)productId {
    return @"ProductId";
}
- (id)transactionId {
    return @"TransactionId";
}
- (id)originalTransactionId {
    return @"OriginalTransactionId";
}
- (id)originalPurchaseDateTime {
    return NSDate.distantPast;
}
- (id)lastPurchaseDateTime {
    return NSDate.distantPast;
}
- (id)expirationDateTime {
    return NSDate.distantFuture;
}
- (id)cancellationDateTime {
    return NSDate.distantFuture;
}
%end
%hook BZRReceiptInfo
- (id)subscription {
    return [[objc_getClass("BZRReceiptSubscriptionInfo") alloc] init];
}
%end

%group Phoenix
%hook PNXMainViewController
- (void)presentViewController:(id)arg1 intrusively:(bool)arg2 presentBlock:(id)arg3 dismissBlock:(id)arg4 {
    return;
}
%end
%end

%ctor {
    @autoreleasepool {
        if ([NSProcessInfo.processInfo.processName isEqualToString:@"Phoenix"]) {
            %init(Phoenix);
        }
        %init(_ungrouped);
    }
}
