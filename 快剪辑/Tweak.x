#import <Foundation/NSString.h>

%hook QHSubSuccessModel
- (long long)vipType {
    return 3;
    // 1 月费会员
    // 2 年费会员
    // 3 永久会员
}
- (long long)lifetime {
    return 99999999;
}
%end
%hook QHVIPManager
- (bool)isSubSuccessed {
    return true;
}
%end

// 去除水印
%hook QHMEVideoEditViewController
- (void)setupWatermarkDisplayView {
    return;
}
%end
