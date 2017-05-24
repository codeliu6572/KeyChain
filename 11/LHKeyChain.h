//
//  KQKeyChain.h
//  11
//
//  Created by shihanbainian on 2017/5/22.
//  Copyright © 2017年 shihanbainian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHKeyChain : NSObject
+ (NSMutableDictionary *)getKeychain:(NSString *)keyChain ;

+ (void)save:(NSString *)keyChain data:(id)data;

+ (id)read:(NSString *)keyChain;

+ (void)lhDelete:(NSString *)keyChain;
@end
