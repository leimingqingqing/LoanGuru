//
//  LGSetViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/3/3.
//

#import "LGSetViewController.h"

@interface LGSetViewController ()
@property (nonatomic, strong)UIButton *backBtn;
@end

@implementation LGSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)setUpView{
    UILabel *topTitleLabel = [[UILabel alloc] init];
    topTitleLabel.text = @"set";
    topTitleLabel.textColor = [UIColor jk_colorWithHexString:@"333333"];
    topTitleLabel.font = [UIFont boldSystemFontOfSize:18.f];
    [self.view addSubview:topTitleLabel];
    [topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(k_StatusBarHeight+7);
        make.centerX.mas_equalTo(self.view);
    }];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.backBtn setImage:[UIImage imageNamed:@"home_auth_blackArrow"] forState:UIControlStateNormal];
    [self.view addSubview:self.backBtn];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_equalTo(topTitleLabel);
        make.width.height.mas_equalTo(26);
    }];
    
    [self.appIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_offset(height(167));
    }];
    
    [self.appNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.appIcon.mas_bottom).mas_offset(20);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(33);
    }];
    
    self.cancellationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancellationBtn setTitle:@"ACCOUNT CANCELLATION" forState:UIControlStateNormal];
    [self.cancellationBtn setBackgroundColor:mainLightColor];
    [self.cancellationBtn setTitleColor:[UIColor jk_colorWithHexString:@"333333"] forState:UIControlStateNormal];
    self.cancellationBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.cancellationBtn.layer.cornerRadius = 25.f;
    [self.view addSubview:self.cancellationBtn];
    [self.cancellationBtn addTarget:self action:@selector(cancellationAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.cancellationBtn yb_addShadowWithColor:mainLightColor];
    [self.cancellationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(35);
        make.right.mas_offset(-35);
        make.height.mas_equalTo(50);
        make.bottom.mas_offset(-height(90));
    }];
    
    self.loginOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginOutBtn setTitle:@"LOGOUT" forState:UIControlStateNormal];
    [self.loginOutBtn setBackgroundColor:mainColor];
    [self.loginOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginOutBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.loginOutBtn.layer.cornerRadius = 25.f;
    [self.view addSubview:self.loginOutBtn];
    [self.loginOutBtn addTarget:self action:@selector(cancellationAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginOutBtn yb_addShadowWithColor:mainColor];
    [self.loginOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(35);
        make.right.mas_offset(-35);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(self.cancellationBtn.mas_top).mas_offset(-24);
    }];
}

-(void)backAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)cancellationAction:(UIButton *)btn{
    
}
@end
