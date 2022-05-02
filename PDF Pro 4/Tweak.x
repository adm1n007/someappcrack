%hook PPSubscriptionManager
- (bool)premiumSubscriptionIsActive {
    return true;
}
%end
