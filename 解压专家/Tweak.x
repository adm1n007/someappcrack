%hook IAPHelper
+ (bool)checkIsPurchased {
    return true;
}
+ (bool)checkIsPurchasedOneTime {
    return true;
}
%end
