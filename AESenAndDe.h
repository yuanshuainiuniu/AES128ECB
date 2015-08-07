//
//  AESenAndDe.h
//
//  Created by 蒋晓冬 on 14-6-4.
//
//

#import <Foundation/Foundation.h>

@interface AESenAndDe : NSObject

/*!
 *  加密以后再 base64 转成字符串
 *
 *  @param str 需要加密的字符串
 *
 *  @return NSData数据
 */
+(NSData *)En_AESandBase64ToData:(NSString *)str;

/*!
 *  加密以后再 base64 转成字符串
 *
 *  @param str 需要加密的字符串
 *
 *  @return NSString数据
 */
+(NSString *)En_AESandBase64EnToString:(NSString *)str;
/* 以上为加密
 =================================== ===================================
 =================================== ===================================
 以下为解密*/

/*!
 *  base64 转换以后解密
 *
 *  @param str 需要解密的 base64字符串
 *
 *  @return 解密后字符串
 */
+(NSString *)De_Base64andAESDeToString:(NSString *)str;

/*!
 *  base64 转换以后解密
 *
 *  @param str 需要解密的 base64字符串
 *
 *  @return 解密后NSData
 */
+(NSData *)De_Base64andAESToData:(NSString *)str;

/*!
 *  base64 转换以后解密
 *
 *  @param str 需要解密的 base64字符串
 *
 *  @return 解密后字典
 */
+(NSDictionary *)De_Base64andAESToDictionary:(NSString *)str;

@end
