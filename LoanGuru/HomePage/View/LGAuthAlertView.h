//
//  LGAuthAlertView.h
//  LoanGuru
//
//  Created by Apple on 2023/2/28.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LGFrontAlertStyle,
    LGBackAlertStyle,
    LGPanAlertStyle
} LGAuthAlertStyle;

NS_ASSUME_NONNULL_BEGIN

@interface LGAuthAlertView : UIView
-(instancetype)initWithFrame:(CGRect)frame style:(LGAuthAlertStyle)style;
@property(nonatomic, copy)void(^okBlock)(void);
@end

NS_ASSUME_NONNULL_END
