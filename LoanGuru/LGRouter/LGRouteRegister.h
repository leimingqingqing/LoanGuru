//
//  YBRouteRegister.h
//  AFNetworking
//
//  Created by LQ on 2018/7/17.
//

#import <Foundation/Foundation.h>
@protocol LGRouteRegisterProtocol

@required

- (void)enroll;

@end

@interface LGRouteRegister : NSObject <LGRouteRegisterProtocol>


+ (void)enroll:(NSArray<__kindof NSString*>*)modules;


@end

