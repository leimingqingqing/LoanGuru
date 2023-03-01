//
//  LGLivingRecognitionViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/2/28.
//

#import "LGLivingRecognitionViewController.h"
@interface LGLivingRecognitionViewController ()
@property (nonatomic, strong)UIButton *backBtn;
@property (nonatomic, strong)UILabel *topTipLabel;
@property (nonatomic, strong)UIImageView *topPositiveImageView;
@property (nonatomic, strong)UILabel *topTiplabel;
@property (nonatomic, strong)UIImageView *exampleErrorIcon01;
@property (nonatomic, strong)UIImageView *exampleErrorIcon02;
@property (nonatomic, strong)UIImageView *exampleErrorIcon03;
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
    
    
}

-(void)backAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
