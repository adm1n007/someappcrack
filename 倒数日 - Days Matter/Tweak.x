%hook CLInAppPurchaseFeatureManager
- (bool)isUnlockedForFeature:(id)a1 {
    return true;
}
%end
%hook DMInAppPurchaseHandler
+ (bool)isProVersionPurchased {
    return true;
}
%end
