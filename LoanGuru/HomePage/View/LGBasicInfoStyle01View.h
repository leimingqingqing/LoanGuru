//
//  LGBasicInfoStyle01View.h
//  LoanGuru
//
//  Created by Apple on 2023/3/2.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface LGBasicInfoStyle01View : UIView
@property (nonatomic, strong)UILabel *fillTitleLabel;
@property (nonatomic, strong)UIView *fillBgView;
@property (nonatomic, strong)UITextField *fillInfoTextField;
@property (nonatomic, strong)NSString *titleStr;
@property (nonatomic, strong)UIImageView *arrowIcon;
@property (nonatomic)NSString *fillType;
-(instancetype)initWithFrame:(CGRect)frame titleStr:(NSString *)titleStr type:(NSString *)type;
@end

NS_ASSUME_NONNULL_END
