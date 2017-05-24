//
//  KQKeyChain.m
//  11
//
//  Created by shihanbainian on 2017/5/22.
//  Copyright © 2017年 shihanbainian. All rights reserved.
//

#import "LHKeyChain.h"

@implementation LHKeyChain
+ (NSMutableDictionary *)getKeychain:(NSString *)keyChain {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
            keyChain, (__bridge_transfer id)kSecAttrService,
            keyChain, (__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
            nil];
}

+ (void)save:(NSString *)keyChain data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychain:keyChain];
    //Delete old item before add new item
    CFDictionaryRef aRef = (__bridge_retained CFDictionaryRef)keychainQuery;
    SecItemDelete(aRef);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd(aRef, NULL);
}

+ (id)read:(NSString *)keyChain {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychain:keyChain];
    //Configure the search setting
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", keyChain, e);
        } @finally {
        }
    }
    return ret;
}

+ (void)lhDelete:(NSString *)keyChain {
    NSMutableDictionary *keychainQuery = [self getKeychain:keyChain];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
}
@end
