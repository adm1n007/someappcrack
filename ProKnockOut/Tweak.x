%hook MKStoreManager
+ (bool)featureSVIPPurchased {
    return true;
}
%end
