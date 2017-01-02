//
//  DesUtil.h
//  Card2Card
//
//  Created by xiaofan-pc on 13-12-5.
//  Copyright (c) 2013年 dafy. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CommonCrypto/CommonCryptor.h>

@interface DesUtil : NSObject

+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key;
+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key;

@end
