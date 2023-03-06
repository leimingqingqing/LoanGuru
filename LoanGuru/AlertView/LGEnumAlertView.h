//
//  LGEnumAlertView.h
//  LoanGuru
//
//  Created by Apple on 2023/3/2.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LGCommonAlertStyle,
    LGLocationAlertStyle
} LGBottomAlertStyle;

NS_ASSUME_NONNULL_BEGIN

@interface LGEnumAlertView : UIView
@property (nonatomic, strong)UIPickerView *pickerview;
@property (nonatomic, strong)UIView *contentView;
@property (nonatomic, strong)NSArray *itemArr;
@property (nonatomic)LGBottomAlertStyle alertStyle;
-(instancetype)initWithFrame:(CGRect)frame style:(LGBottomAlertStyle)style itemArr:(NSArray *)itemArr;
@end

NS_ASSUME_NONNULL_END
