//
//  LGHelper.m
//  LoanGuru
//
//  Created by Apple on 2023/3/1.
//

#import "LGHelper.h"
#import <sys/utsname.h>
#import <AdSupport/AdSupport.h>
@implementation LGHelper
+ (NSString *)getCurrentDeviceModel{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * phoneType = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if([phoneType  isEqualToString:@"iPhone1,1"])  return @"iPhone 2G";
    if([phoneType  isEqualToString:@"iPhone1,2"])  return @"iPhone 3G";
    if([phoneType  isEqualToString:@"iPhone2,1"])  return @"iPhone 3GS";
    if([phoneType  isEqualToString:@"iPhone3,1"])  return @"iPhone 4";
    if([phoneType  isEqualToString:@"iPhone3,2"])  return @"iPhone 4";
    if([phoneType  isEqualToString:@"iPhone3,3"])  return @"iPhone 4";
    if([phoneType  isEqualToString:@"iPhone4,1"])  return @"iPhone 4S";
    if([phoneType  isEqualToString:@"iPhone5,1"])  return @"iPhone 5";
    if([phoneType  isEqualToString:@"iPhone5,2"])  return @"iPhone 5";
    if([phoneType  isEqualToString:@"iPhone5,3"])  return @"iPhone 5c";
    if([phoneType  isEqualToString:@"iPhone5,4"])  return @"iPhone 5c";
    if([phoneType  isEqualToString:@"iPhone6,1"])  return @"iPhone 5s";
    if([phoneType  isEqualToString:@"iPhone6,2"])  return @"iPhone 5s";
    if([phoneType  isEqualToString:@"iPhone7,1"])  return @"iPhone 6 Plus";
    if([phoneType  isEqualToString:@"iPhone7,2"])  return @"iPhone 6";
    if([phoneType  isEqualToString:@"iPhone8,1"])  return @"iPhone 6s";
    if([phoneType  isEqualToString:@"iPhone8,2"])  return @"iPhone 6s Plus";
    if([phoneType  isEqualToString:@"iPhone8,4"])  return @"iPhone SE";
    if([phoneType  isEqualToString:@"iPhone9,1"])  return @"iPhone 7";
    if([phoneType  isEqualToString:@"iPhone9,2"])  return @"iPhone 7 Plus";
    if([phoneType  isEqualToString:@"iPhone9,4"])  return @"iPhone 7 Plus";
    if([phoneType  isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if([phoneType  isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if([phoneType  isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if([phoneType  isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if([phoneType  isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if([phoneType  isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    if([phoneType  isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    if([phoneType  isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    if([phoneType  isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    if([phoneType  isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    if([phoneType  isEqualToString:@"iPhone12,1"])  return @"iPhone 11";
    if ([phoneType isEqualToString:@"iPhone12,3"])  return @"iPhone 11 Pro";
    if ([phoneType isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
    if ([phoneType isEqualToString:@"iPhone12,8"])   return @"iPhone SE2";
    if ([phoneType isEqualToString:@"iPhone13,1"])    return @"iPhone 12 mini";
    if ([phoneType isEqualToString:@"iPhone13,2"])    return @"iPhone 12";
    if ([phoneType isEqualToString:@"iPhone13,3"])    return @"iPhone 12 Pro";
    if ([phoneType isEqualToString:@"iPhone13,4"])    return @"iPhone 12 Pro Max";
    if ([phoneType isEqualToString:@"iPhone14,4"])    return @"iPhone 13 mini";
    if ([phoneType isEqualToString:@"iPhone14,5"])    return @"iPhone 13";
    if ([phoneType isEqualToString:@"iPhone14,2"])    return @"iPhone 13 Pro";
    if ([phoneType isEqualToString:@"iPhone14,3"])    return @"iPhone 13 Pro Max";
    if ([phoneType isEqualToString:@"iPhone14,6"])    return @"iPhone SE"; //(2nd generation)
    if ([phoneType isEqualToString:@"iPhone14,7"])    return @"iPhone 14";
    if ([phoneType isEqualToString:@"iPhone14,8"])    return @"iPhone 14 Plus";
    if ([phoneType isEqualToString:@"iPhone15,2"])    return @"iPhone 14 Pro";
    if ([phoneType isEqualToString:@"iPhone15,3"])    return @"iPhone 14 Pro Max";
    //iPad
    if ([phoneType isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([phoneType isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    
    if ([phoneType isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([phoneType isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([phoneType isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([phoneType isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([phoneType isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([phoneType isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([phoneType isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    
    if ([phoneType isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([phoneType isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([phoneType isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([phoneType isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([phoneType isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([phoneType isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    
    if ([phoneType isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([phoneType isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([phoneType isEqualToString:@"iPad4,3"])      return @"iPad Air";
    
    if ([phoneType isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([phoneType isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([phoneType isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    
    if ([phoneType isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([phoneType isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([phoneType isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    
    if ([phoneType isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([phoneType isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([phoneType isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([phoneType isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    
    if ([phoneType isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([phoneType isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([phoneType isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([phoneType isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    
    if ([phoneType isEqualToString:@"iPad6,11"])     return @"iPad 5th";
    if ([phoneType isEqualToString:@"iPad6,12"])     return @"iPad 5th";
    
    if ([phoneType isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9 2nd";
    if ([phoneType isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9 2nd";
    if ([phoneType isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5";
    if ([phoneType isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5";
    
    if ([phoneType isEqualToString:@"iPad7,5"])      return @"iPad 6th";
    if ([phoneType isEqualToString:@"iPad7,6"])      return @"iPad 6th";
    
    if ([phoneType isEqualToString:@"iPad8,1"])      return @"iPad Pro 11";
    if ([phoneType isEqualToString:@"iPad8,2"])      return @"iPad Pro 11";
    if ([phoneType isEqualToString:@"iPad8,3"])      return @"iPad Pro 11";
    if ([phoneType isEqualToString:@"iPad8,4"])      return @"iPad Pro 11";
    
    if ([phoneType isEqualToString:@"iPad8,5"])      return @"iPad Pro 12.9 3rd";
    if ([phoneType isEqualToString:@"iPad8,6"])      return @"iPad Pro 12.9 3rd";
    if ([phoneType isEqualToString:@"iPad8,7"])      return @"iPad Pro 12.9 3rd";
    if ([phoneType isEqualToString:@"iPad8,8"])      return @"iPad Pro 12.9 3rd";
    
    if ([phoneType isEqualToString:@"iPad11,1"])      return @"iPad mini 5th";
    if ([phoneType isEqualToString:@"iPad11,2"])      return @"iPad mini 5th";
    if ([phoneType isEqualToString:@"iPad11,3"])      return @"iPad Air 3rd";
    if ([phoneType isEqualToString:@"iPad11,4"])      return @"iPad Air 3rd";
    
    if ([phoneType isEqualToString:@"iPad11,6"])      return @"iPad 8th";
    if ([phoneType isEqualToString:@"iPad11,7"])      return @"iPad 8th";
    
    if ([phoneType isEqualToString:@"iPad12,1"])      return @"iPad 9th";
    if ([phoneType isEqualToString:@"iPad12,2"])      return @"iPad 9th";
    
    if ([phoneType isEqualToString:@"iPad14,1"])      return @"iPad mini 6th";
    if ([phoneType isEqualToString:@"iPad14,2"])      return @"iPad mini 6th";
    
    //iPod
    if ([phoneType isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([phoneType isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([phoneType isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([phoneType isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([phoneType isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    if ([phoneType isEqualToString:@"iPod7,1"])      return @"iPod Touch (6 Gen)";
    if ([phoneType isEqualToString:@"iPod9,1"])      return @"iPod Touch (7 Gen)";
    
    if ([phoneType isEqualToString:@"i386"])         return @"Simulator";
    if ([phoneType isEqualToString:@"x86_64"])       return @"Simulator";
    
    return phoneType;
}

+ (NSString *)getIdfa{
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return idfa;
}

+ (NSString *)getIdfv{
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return idfv;
}
@end
