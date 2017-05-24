//
//  KQUUIDManager.h
//  11
//
//  Created by shihanbainian on 2017/5/22.
//  Copyright © 2017年 shihanbainian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHUUIDManager : NSObject
+(void)saveUUID; //保存UUID

+(id)readUUID; //获取UUID

+(void)deleteUUID; //删除
@end
