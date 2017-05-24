//
//  KQUUIDManager.m
//  11
//
//  Created by shihanbainian on 2017/5/22.
//  Copyright © 2017年 shihanbainian. All rights reserved.
//

#import "LHUUIDManager.h"
#import "LHKeyChain.h"

@implementation LHUUIDManager : NSObject 
static NSString * const KEY_IN_KEYCHAIN = @"KEY_IN_KEYCHAIN";
static NSString * const KEY_IN_UUID = @"KEY_IN_UUID";

+(void)saveUUID
{
    NSMutableDictionary *myUUIDDic = [NSMutableDictionary dictionary];
    [myUUIDDic setObject:[self creatUUID] forKey:KEY_IN_UUID];
    [LHKeyChain save:KEY_IN_KEYCHAIN data:myUUIDDic];
}

+(id)readUUID
{
    NSMutableDictionary *myUUIDDic = (NSMutableDictionary *)[LHKeyChain read:KEY_IN_KEYCHAIN];
    return [myUUIDDic objectForKey:KEY_IN_UUID];
}

+(void)deleteUUID
{
    [LHKeyChain lhDelete:KEY_IN_KEYCHAIN];
}

+(NSString *)creatUUID
{
    CFUUIDRef myUUID = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, myUUID );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    return result;
}
@end
