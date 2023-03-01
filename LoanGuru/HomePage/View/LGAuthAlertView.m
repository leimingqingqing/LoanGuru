//
//  LGAuthAlertView.m
//  LoanGuru
//
//  Created by Apple on 2023/2/28.
//

#import "LGAuthAlertView.h"
@interface LGAuthAlertView()
@property (nonatomic)LGAuthAlertStyle style;
@property (nonatomic, strong)UIView *contentView;
@property (nonatomic, strong)UIButton *closeBtn;
@property (nonatomic, strong)UILabel *topTitleLabel;
@property (nonatomic, strong)UIView *topPhotoView;
@property (nonatomic, strong)UIImageView *topPhotoImageView;
@property (nonatomic, strong)UILabel *topBottomTipLabel;
@property (nonatomic, strong)UIImageView *topCorrectIcon;
@property (nonatomic, strong)UIImageView *errorExampleIcon01;
@property (nonatomic, strong)UIImageView *errorExampleIcon02;
@property (nonatomic, strong)UIImageView *errorExampleIcon03;
@property (nonatomic, strong)NSArray *frontImageArr;
@property (nonatomic, strong)NSArray *backImageArr;
@property (nonatomic, strong)NSArray *panImageArr;
@property (nonatomic, strong)UIButton *okBtn;
@end

@implementation LGAuthAlertView
-(instancetype)initWithFrame:(CGRect)frame style:(LGAuthAlertStyle)style{
    self = [super initWithFrame:frame];
    if(self){
        _style = style;
        _frontImageArr = @[@"home_auth_frontAlertPhoto",@"home_auth_frontAlertError01",@"home_auth_frontAlertError02",@"home_auth_frontAlertError03"];
        _backImageArr = @[@"home_auth_backAlertPhoto",@"home_auth_backAlertError01",@"home_auth_backAlertError02",@"home_auth_backAlertError03"];
        _panImageArr = @[@"home_auth_panAlertPhoto",@"home_auth_panAlertError01",@"home_auth_panAlertError02",@"home_auth_panAlertError03"];
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 16.f;
    self.contentView.clipsToBounds = YES;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width(292));
        make.height.mas_equalTo(444);
        make.centerY.mas_equalTo(self).mas_offset(-12);
        make.centerX.mas_equalTo(self);
    }];
    
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeBtn addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.closeBtn setImage:[UIImage imageNamed:@"home_auth_alertCloseIcon"] forState:UIControlStateNormal];
    [self addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(38);
        make.top.mas_equalTo(self.contentView.mas_bottom).mas_offset(15);
        make.centerX.mas_equalTo(self);
    }];
    
    self.topTitleLabel = [[UILabel alloc] init];
    self.topTitleLabel.textColor = [UIColor jk_colorWithHexString:@"333333"];
    self.topTitleLabel.font = [UIFont boldSystemFontOfSize:18.f];
    [self.contentView addSubview:self.topTitleLabel];
    [self.topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_offset(23);
    }];
    
    self.topPhotoImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.topPhotoImageView];
    [self.topPhotoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(12);
        make.top.mas_equalTo(self.topTitleLabel.mas_bottom).mas_offset(12);
        make.right.mas_offset(-12);
        make.height.mas_equalTo((width(292) - 24)*162/271);
    }];
    
    self.topCorrectIcon = [[UIImageView alloc] init];
    self.topCorrectIcon.image = [UIImage imageNamed:@"home_auth_alertCorrectIcon"];
    [self.contentView addSubview:self.topCorrectIcon];
    [self.topCorrectIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.topPhotoImageView.mas_bottom).mas_offset(-6);
        make.right.mas_equalTo(self.topPhotoImageView.mas_right).mas_offset(-6);
    }];
    
    self.topBottomTipLabel = [[UILabel alloc] init];
    self.topBottomTipLabel.text = @"Please upload the front photo of Pan.";
    self.topBottomTipLabel.textColor = [UIColor jk_colorWithHexString:@"FF7877"];
    self.topBottomTipLabel.font = [UIFont boldSystemFontOfSize:12.f];
    [self.contentView addSubview:self.topBottomTipLabel];
    [self.topBottomTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topPhotoImageView.mas_bottom).mas_offset(8);
        make.centerX.mas_equalTo(self.contentView);
    }];
    
    self.errorExampleIcon02 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.errorExampleIcon02];
    [self.errorExampleIcon02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.topBottomTipLabel.mas_bottom).mas_offset(27);
    }];
    
    UILabel *errorLabel02 = [[UILabel alloc] init];
    errorLabel02.text = @"Have Flash";
    errorLabel02.font = [UIFont boldSystemFontOfSize:12.f];
    errorLabel02.textColor = [UIColor jk_colorWithHexString:@"FF7877"];
    [self.contentView addSubview:errorLabel02];
    [errorLabel02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.errorExampleIcon02);
        make.top.mas_equalTo(self.errorExampleIcon02.mas_bottom).mas_offset(8);
    }];
    
    self.errorExampleIcon01 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.errorExampleIcon01];
    [self.errorExampleIcon01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.errorExampleIcon02.mas_left).mas_offset(-5);
        make.top.mas_equalTo(self.topBottomTipLabel.mas_bottom).mas_offset(27);
    }];
    
    UILabel *errorLabel01 = [[UILabel alloc] init];
    errorLabel01.text = @"Not Clear";
    errorLabel01.font = [UIFont boldSystemFontOfSize:12.f];
    errorLabel01.textColor = [UIColor jk_colorWithHexString:@"FF7877"];
    [self.contentView addSubview:errorLabel01];
    [errorLabel01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.errorExampleIcon01);
        make.top.mas_equalTo(self.errorExampleIcon01.mas_bottom).mas_offset(8);
    }];
    
    self.errorExampleIcon03 = [[UIImageView alloc] init];
    [self.contentView addSubview:self.errorExampleIcon03];
    [self.errorExampleIcon03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.errorExampleIcon02.mas_right).mas_offset(5);
        make.top.mas_equalTo(self.topBottomTipLabel.mas_bottom).mas_offset(27);
    }];
    
    UILabel *errorLabel03 = [[UILabel alloc] init];
    errorLabel03.text = @"Incomplete";
    errorLabel03.font = [UIFont boldSystemFontOfSize:12.f];
    errorLabel03.textColor = [UIColor jk_colorWithHexString:@"FF7877"];
    [self.contentView addSubview:errorLabel03];
    [errorLabel03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.errorExampleIcon03);
        make.top.mas_equalTo(self.errorExampleIcon03.mas_bottom).mas_offset(8);
    }];
    
    if(_style == LGFrontAlertStyle){
        self.topTitleLabel.text = @"Aadhaar Front";
        self.topPhotoImageView.image = [UIImage imageNamed:self.frontImageArr[0]];
        self.errorExampleIcon01.image = [UIImage imageNamed:self.frontImageArr[1]];
        self.errorExampleIcon02.image = [UIImage imageNamed:self.frontImageArr[2]];
        self.errorExampleIcon03.image = [UIImage imageNamed:self.frontImageArr[3]];
    }else if(_style == LGBackAlertStyle){
        self.topTitleLabel.text = @"Aadhaar Back";
        self.topPhotoImageView.image = [UIImage imageNamed:self.backImageArr[0]];
        self.errorExampleIcon01.image = [UIImage imageNamed:self.backImageArr[1]];
        self.errorExampleIcon02.image = [UIImage imageNamed:self.backImageArr[2]];
        self.errorExampleIcon03.image = [UIImage imageNamed:self.backImageArr[3]];
    }else{
        self.topTitleLabel.text = @"Pan Card";
        self.topPhotoImageView.image = [UIImage imageNamed:self.panImageArr[0]];
        self.errorExampleIcon01.image = [UIImage imageNamed:self.panImageArr[1]];
        self.errorExampleIcon02.image = [UIImage imageNamed:self.panImageArr[2]];
        self.errorExampleIcon03.image = [UIImage imageNamed:self.panImageArr[3]];
    }
    
    self.okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.okBtn addTarget:self action:@selector(okAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.okBtn setTitle:@"OK" forState:UIControlStateNormal];
    [self.okBtn setBackgroundColor:mainColor];
    self.okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.okBtn.layer.cornerRadius = 25.f;
    [self.contentView addSubview:self.okBtn];
    [self.okBtn yb_addShadowWithColor:mainColor];
    [self.okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(18);
        make.right.mas_offset(-18);
        make.height.mas_equalTo(50);
        make.bottom.mas_offset(-28);
    }];
}

-(void)closeAction:(UIButton *)sender{
    [self removeFromSuperview];
}

-(void)okAction:(UIButton *)sender{
    [self removeFromSuperview];
    if(self.okBlock){
        self.okBlock();
    }
}
@end
