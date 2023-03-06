//
//  LGUIKit.h
//  LoanGuru
//
//  Created by Apple on 2023/2/24.
//

#ifndef LGUIKit_h
#define LGUIKit_h

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define width(a) (SCREEN_WIDTH/375)*a
#define height(a) (SCREEN_HEIGHT/667)*a

#define k_StatusBarHeight (SCREEN_HEIGHT >= 812.0 ? 44 : 20)
#define k_NavigationBarHeight (SCREEN_HEIGHT >= 812.0 ? 88 : 64)
#define k_SafeAreaBottomHeight (SCREEN_HEIGHT >= 812.0 ? 34 : 0)

#define mainColor [UIColor jk_colorWithHexString:@"0C7472"]
#define mainLightColor [UIColor jk_colorWithHexString:@"E6F1F1"]
#endif /* LGUIKit_h */
