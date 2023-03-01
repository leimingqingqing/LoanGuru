//
//  LGConfirmCardInfoAlertView.h
//  LoanGuru
//
//  Created by Apple on 2023/2/28.
//

#import <UIKit/UIKit.h>
#import <TPKeyboardAvoidingScrollView.h>
typedef enum : NSUInteger {
    LGConfirmFrontAlertStyle,
    LGConfirmBackAlertStyle,
    LGConfirmPanAlertStyle
} LGAuthConfirmCardInfoAlertStyle;

NS_ASSUME_NONNULL_BEGIN

@interface LGConfirmCardInfoAlertView : UIView
-(instancetype)initWithFrame:(CGRect)frame style:(LGAuthConfirmCardInfoAlertStyle)style;
@end

@interface LGCardFillInfoItem : UIView
@property (nonatomic, strong)UILabel *fillTitleLabel;
@property (nonatomic, strong)UIView *fillBgView;
@property (nonatomic, strong)UITextField *fillInfoTextField;
@property (nonatomic, strong)NSString *titleStr;
-(instancetype)initWithFrame:(CGRect)frame titleStr:(NSString *)titleStr;
@end

NS_ASSUME_NONNULL_END
