//
//  LGBasicInfoStyle01View.m
//  LoanGuru
//
//  Created by Apple on 2023/3/2.
//

#import "LGBasicInfoStyle01View.h"
@interface LGBasicInfoStyle01View()

@end
@implementation LGBasicInfoStyle01View
-(instancetype)initWithFrame:(CGRect)frame titleStr:(NSString *)titleStr type:(NSString *)type{
    self = [super initWithFrame:frame];
    if(self){
        _titleStr = titleStr;
        _fillType = type;
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    self.fillTitleLabel = [[UILabel alloc] init];
    self.fillTitleLabel.textColor = [UIColor jk_colorWithHexString:@"888888"];
    self.fillTitleLabel.font = [UIFont systemFontOfSize:15.f];
    self.fillTitleLabel.text = self.titleStr;
    [self addSubview:self.fillTitleLabel];
    [self.fillTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.mas_offset(10);
    }];
    
    self.fillBgView = [[UIView alloc] init];
    self.fillBgView.backgroundColor = [UIColor jk_colorWithHexString:@"F1F5F9"];
    self.fillBgView.layer.cornerRadius = 8.0f;
    self.fillBgView.clipsToBounds = YES;
    [self addSubview:self.fillBgView];
    [self.fillBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.fillTitleLabel);
        make.right.mas_offset(0);
        make.top.mas_equalTo(self.fillTitleLabel.mas_bottom).mas_offset(8);
        make.height.mas_equalTo(38);
    }];
     
    self.fillInfoTextField = [[UITextField alloc] init];
    self.fillInfoTextField.textColor = [UIColor jk_colorWithHexString:@"444444"];
    self.fillInfoTextField.font = [UIFont systemFontOfSize:14.f];
    [self.fillBgView addSubview:self.fillInfoTextField];
    [self.fillInfoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_offset(0);
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
    }];
    
    if([self.fillType isEqualToString:@"enum"] || [self.fillType isEqualToString:@"citySelect"]){
        self.fillBgView.userInteractionEnabled = NO;
        self.arrowIcon = [[UIImageView alloc] init];
        self.arrowIcon.image = [UIImage imageNamed:@"home_auth_fillInfoArrow"];
        [self.fillBgView addSubview:self.arrowIcon];
        [self.arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-10);
            make.centerY.mas_equalTo(self.fillBgView);
        }];
    }
}
@end
