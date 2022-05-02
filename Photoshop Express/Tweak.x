%hook PSBaseSubscriptionManager
- (bool)isUserSubscribed {
    return true;
}
- (bool)premiumEnabledForUser {
    return true;
}
%end
