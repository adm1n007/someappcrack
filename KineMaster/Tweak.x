%hook _TtC11PurchaseKit24PurchaseStateServiceImpl
- (bool)isPremiumUser {
    return true;
}
- (bool)isStartUpPurchaseStateRefreshBlocked {
    return false;
}
- (bool)shouldRemoveWaterMark {
    return true;
}
- (long long)userType {
    return 6;
}
%end
%hook _TtC11PurchaseKit15PurchaseService
- (bool)canUsePremiumAssets {
    return true;
}
%end
