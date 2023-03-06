//
//  LGLivingRecognitionViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/2/28.
//

#import "LGLivingRecognitionViewController.h"
@interface LGLivingRecognitionViewController ()
@property (nonatomic, strong)UIButton *backBtn;
@property (nonatomic, strong)UIImageView *topPositiveImageView;
@property (nonatomic, strong)UILabel *topTiplabel;
@property (nonatomic, strong)UIImageView *errorExampleIcon01;
@property (nonatomic, strong)UIImageView *errorExampleIcon02;
@property (nonatomic, strong)UIImageView *errorExampleIcon03;
@property (nonatomic, strong)UIButton *determineBtn;
@end

@implementation LGLivingRecognitionViewController

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
    topTitleLabel.text = @"Living Recognition";
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
    
    self.topPositiveImageView = [[UIImageView alloc] init];
    self.topPositiveImageView.image = [UIImage imageNamed:@"home_living_positive"];
    [self.view addSubview:self.topPositiveImageView];
    [self.topPositiveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topTitleLabel.mas_bottom).mas_offset(35);
        make.centerX.mas_equalTo(self.view);
    }];
    
    self.topTiplabel = [[UILabel alloc] init];
    self.topTiplabel.text = @"Face the screen and mack sure the face is clean";
    self.topTiplabel.textAlignment = NSTextAlignmentCenter;
    self.topTiplabel.numberOfLines = 0;
    self.topTiplabel.textColor = [UIColor jk_colorWithHexString:@"FF7877"];
    self.topTiplabel.font = [UIFont boldSystemFontOfSize:12.f];
    [self.view addSubview:self.topTiplabel];
    [self.topTiplabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(243);
        make.top.mas_equalTo(self.topPositiveImageView.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(self.view);
    }];
    
    UIView *blueLine = [[UIView alloc] init];
    blueLine.backgroundColor = [UIColor jk_colorWithHexString:@"E6F1F1"];
    [self.view addSubview:blueLine];
    [blueLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(52);
        make.right.mas_offset(-52);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(self.topTiplabel.mas_bottom).mas_offset(30);
    }];
    
    self.errorExampleIcon02 = [[UIImageView alloc] init];
    self.errorExampleIcon02.image = [UIImage imageNamed:@"home_living_error02"];
    [self.view addSubview:self.errorExampleIcon02];
    [self.errorExampleIcon02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(blueLine.mas_bottom).mas_offset(27);
    }];
    
    UILabel *errorLabel02 = [[UILabel alloc] init];
    errorLabel02.text = @"Face is not aligned";
    errorLabel02.numberOfLines = 0;
    errorLabel02.textAlignment = NSTextAlignmentCenter;
    errorLabel02.font = [UIFont boldSystemFontOfSize:12.f];
    errorLabel02.textColor = [UIColor jk_colorWithHexString:@"FF7877"];
    [self.view addSubview:errorLabel02];
    [errorLabel02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.errorExampleIcon02);
        make.top.mas_equalTo(self.errorExampleIcon02.mas_bottom).mas_offset(8);
        make.width.mas_equalTo(98);
    }];
    
    self.errorExampleIcon01 = [[UIImageView alloc] init];
    self.errorExampleIcon01.image = [UIImage imageNamed:@"home_living_error01"];
    [self.view addSubview:self.errorExampleIcon01];
    [self.errorExampleIcon01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.errorExampleIcon02.mas_left).mas_offset(-21);
        make.top.mas_equalTo(blueLine.mas_bottom).mas_offset(27);
    }];
    
    UILabel *errorLabel01 = [[UILabel alloc] init];
    errorLabel01.text = @"Face is occluded";
    errorLabel01.textAlignment = NSTextAlignmentCenter;
    errorLabel01.numberOfLines = 0;
    errorLabel01.font = [UIFont boldSystemFontOfSize:12.f];
    errorLabel01.textColor = [UIColor jk_colorWithHexString:@"FF7877"];
    [self.view addSubview:errorLabel01];
    [errorLabel01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.errorExampleIcon01);
        make.top.mas_equalTo(self.errorExampleIcon01.mas_bottom).mas_offset(8);
        make.width.mas_equalTo(98);
    }];
    
    self.errorExampleIcon03 = [[UIImageView alloc] init];
    self.errorExampleIcon03.image = [UIImage imageNamed:@"home_living_error03"];
    [self.view addSubview:self.errorExampleIcon03];
    [self.errorExampleIcon03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.errorExampleIcon02.mas_right).mas_offset(21);
        make.top.mas_equalTo(blueLine.mas_bottom).mas_offset(27);
    }];
    
    UILabel *errorLabel03 = [[UILabel alloc] init];
    errorLabel03.text = @"Inappropriate light";
    errorLabel03.numberOfLines = 0;
    errorLabel03.textAlignment = NSTextAlignmentCenter;
    errorLabel03.font = [UIFont boldSystemFontOfSize:12.f];
    errorLabel03.textColor = [UIColor jk_colorWithHexString:@"FF7877"];
    [self.view addSubview:errorLabel03];
    [errorLabel03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.errorExampleIcon03);
        make.top.mas_equalTo(self.errorExampleIcon03.mas_bottom).mas_offset(8);
        make.width.mas_equalTo(98);
    }];
    
    self.determineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.determineBtn setTitle:@"Determine" forState:UIControlStateNormal];
    [self.determineBtn setBackgroundColor:mainLightColor];
    self.determineBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.determineBtn setTitleColor:[UIColor jk_colorWithHexString:@"333333"] forState:UIControlStateNormal];
    self.determineBtn.layer.cornerRadius = 25.f;
    [self.view addSubview:self.determineBtn];
    [self.determineBtn addTarget:self action:@selector(determineAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.determineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(35);
        make.right.mas_offset(-35);
        make.height.mas_equalTo(50);
        make.bottom.mas_offset(-15);
    }];
}

-(void)determineAction:(UIButton *)sender{
    
}

-(void)backAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
