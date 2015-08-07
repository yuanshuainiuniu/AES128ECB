#import "AESenAndDe.h"
#import "FBEncryptorAES.h"
#import "GTMBase64.h"

#define kKey @"H!A@O#C$H%E^E&DA"

@implementation AESenAndDe


/*!
 *  加密以后再 base64 转成字符串
 *
 *  @param str 需要加密的字符串
 *
 *  @return NSData数据
 */
+(NSData *)En_AESandBase64ToData:(NSString *)str
{
    NSData *data_aes = [FBEncryptorAES encryptData:[str dataUsingEncoding:NSUTF8StringEncoding]
                                               key:[kKey dataUsingEncoding:NSASCIIStringEncoding]];

    return [[NSString stringWithFormat:@"%@",[GTMBase64 stringByEncodingData:data_aes]] dataUsingEncoding:NSUTF8StringEncoding];
}

/*!
 *  加密以后再 base64 转成字符串
 *
 *  @param str 需要加密的字符串
 *
 *  @return NSString数据
 */
+(NSString *)En_AESandBase64EnToString:(NSString *)str
{
    NSData *data_aes = [FBEncryptorAES encryptData:[str dataUsingEncoding:NSUTF8StringEncoding]
                                               key:[kKey dataUsingEncoding:NSASCIIStringEncoding]];
    
    return [NSString stringWithFormat:@"%@",[GTMBase64 stringByEncodingData:data_aes]];

}


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
+(NSString *)De_Base64andAESDeToString:(NSString *)str
{
    NSData *data_dec = [FBEncryptorAES decryptData:[GTMBase64 decodeString:str]
                                               key:[kKey dataUsingEncoding:NSASCIIStringEncoding]];

    return [[NSString alloc]initWithData:data_dec encoding:NSUTF8StringEncoding];
    
}

/*!
 *  base64 转换以后解密
 *
 *  @param str 需要解密的 base64字符串
 *
 *  @return 解密后NSData
 */
+(NSData *)De_Base64andAESToData:(NSString *)str
{
    return [FBEncryptorAES decryptData:[GTMBase64 decodeString:str]
                                   key:[kKey dataUsingEncoding:NSASCIIStringEncoding]];
}

/*!
 *  base64 转换以后解密
 *
 *  @param str 需要解密的 base64字符串
 *
 *  @return 解密后字典
 */
+(NSDictionary *)De_Base64andAESToDictionary:(NSString *)str
{
    NSData *data_dec = [FBEncryptorAES decryptData:[GTMBase64 decodeString:str]
                                               key:[kKey dataUsingEncoding:NSASCIIStringEncoding]];
    
    NSString *str_dec = [[NSString alloc]initWithData:data_dec encoding:NSUTF8StringEncoding];
    if (!str_dec) {
        return nil;
    }

    NSDictionary *jsonObjects =[[NSDictionary alloc]init];
    NSError *e = nil;

    jsonObjects = [NSJSONSerialization JSONObjectWithData: [str_dec dataUsingEncoding:NSUTF8StringEncoding]
                                                  options: NSJSONReadingMutableContainers
                                                    error: &e];

    if (e) {
        return  nil;
    }

    return jsonObjects;
    
}

@end
