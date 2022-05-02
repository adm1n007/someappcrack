#import <Foundation/Foundation.h>

%group Calendars
%hook RDInAppPurchaseManager
- (bool)isProductPurchased:(id)arg1 {
    return true;
}
%end
%end
%group DocumentsAndPDFExpert
%hook RDSubscriptionManagerState
- (bool)hasActiveSharedPDFSubscription {
    return true;
}
%end
%end
%group ScannerPro
%hook Settings
- (bool)hasIsScanner7UserValue {
    return true;
}
- (bool)isScanner7User {
    return true;
}
%end
%end

%ctor {
    @autoreleasepool {
        NSString *processName = NSProcessInfo.processInfo.processName;
        if ([processName isEqualToString:@"CalendarsLite"]) {
            %init(Calendars);
        }
        else if ([processName isEqualToString:@"Documents"]
              || [processName isEqualToString:@"PDFExpert"]) {
            %init(DocumentsAndPDFExpert);
        }
        else if ([processName isEqualToString:@"ScannerPro"]) {
            %init(ScannerPro);
        }
        else {
            return;
        }
    }
}
