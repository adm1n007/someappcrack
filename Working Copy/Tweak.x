%hook PaymentStatus
- (bool)allowedFeature:(int)arg1 missingValue:(bool)arg2 allowTrial:(bool)arg3 {
    return true;
}
%end
