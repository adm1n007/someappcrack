%hook FCInAppPurchaseServiceMobile
- (long long)iapVersionStatus {
    return 1;
}
%end
%hook FCInAppPurchaseServiceBase
- (bool)isFeaturePurchased:(long long)arg1 tillDate:(id *)arg2 {
    return true;
}
%end
