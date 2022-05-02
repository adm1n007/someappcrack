%hook InAppRageIAPHelper
+ (bool)isBuyOneId:(id)arg1 {
    return true;
}
%end
