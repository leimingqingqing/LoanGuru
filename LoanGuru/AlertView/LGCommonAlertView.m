//
//  LGCommonAlertView.m
//  LoanGuru
//
//  Created by Apple on 2023/3/6.
//

#import "LGCommonAlertView.h"
@implementation LGCommonAlertView
-(instancetype)initWithFrame:(CGRect)frame iconImageName:(NSString *)iconImageName tipStr:(NSString *)tipStr{
    self = [super initWithFrame:frame];
    if(self){
        self.imageName = iconImageName;
        self.tipStr = tipStr;
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];

    self.alertContentView = [[UIView alloc] init];
    self.alertContentView.backgroundColor = [UIColor whiteColor];
    self.alertContentView.layer.cornerRadius = 16.f;
    self.alertContentView.clipsToBounds = YES;
    [self addSubview:self.alertContentView];
    [self.alertContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self).mas_offset(-20);
        make.left.mas_offset(width(37));
        make.right.mas_offset(-width(37));
        make.height.mas_equalTo(290);
    }];
    
    self.alertIcon = [[UIImageView alloc] init];
    self.alertIcon.image = [UIImage imageNamed:_imageName];
    [self.alertContentView addSubview:self.alertIcon];
    [self.alertIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(40);
        make.centerX.mas_equalTo(self.alertContentView);
    }];
    
    self.alertTipLabel = [[UILabel alloc] init];
    self.alertTipLabel.textColor = [UIColor jk_colorWithHexString:@"333333"];
    self.alertTipLabel.font = [UIFont systemFontOfSize:14.f];
    self.alertTipLabel.text = self.tipStr;
    [self.alertContentView addSubview:self.alertTipLabel];
    [self.alertTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.alertIcon.mas_bottom).mas_offset(15);
        make.centerX.mas_equalTo(self.alertIcon);
    }];
    
    self.alertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.alertBtn setTitle:@"OK" forState:UIControlStateNormal];
    [self.alertBtn setBackgroundColor:mainColor];
    self.alertBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.alertBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.alertBtn.layer.cornerRadius = 25.f;
    [self.alertContentView addSubview:self.alertBtn];
    [self.alertBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertBtn yb_addShadowWithColor:mainColor];
    [self.alertBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(23);
        make.right.mas_offset(-23);
        make.height.mas_equalTo(50);
        make.bottom.mas_offset(-28);
    }];
}

-(void)confirmAction:(UIButton *)sender{
    [self removeFromSuperview];
}
@end
