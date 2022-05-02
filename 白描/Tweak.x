%hook BMBatchOCRVC
- (bool)checkIfCanBatch {
    return true;
}
%end
%hook BMOCRScanHelper
+ (bool)checkIfCanBatchRec {
    return true;
}
+ (bool)checkIfCanNormalRec {
    return true;
}
+ (bool)checkIfCanTranslateWithLongString:(id)arg1 {
    return true;
}
+ (bool)checkIfCanTranslateWithString:(id)arg1 {
    return true;
}
%end
