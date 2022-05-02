%hook StickersManager
- (bool)isProUpgraded {
    return true;
}
%end
%hook ShopDataManager
- (bool)isProUpgraded {
    return true;
}
%end
