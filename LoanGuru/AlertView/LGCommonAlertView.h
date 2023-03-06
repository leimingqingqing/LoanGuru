//
//  LGCommonAlertView.h
//  LoanGuru
//
//  Created by Apple on 2023/3/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGCommonAlertView : UIView
@property (nonatomic, strong)UIView *alertContentView;
@property (nonatomic, strong)UIImageView *alertIcon;
@property (nonatomic, strong)UILabel *alertTipLabel;
@property (nonatomic, strong)UIButton *alertBtn;
@property (nonatomic, strong)NSString *imageName;
@property (nonatomic, strong)NSString *tipStr;
-(instancetype)initWithFrame:(CGRect)frame iconImageName:(NSString *)iconImageName tipStr:(NSString *)tipStr;
@end

NS_ASSUME_NONNULL_END
