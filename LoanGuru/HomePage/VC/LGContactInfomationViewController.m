//
//  LGContactInfomationViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/3/2.
//

#import "LGContactInfomationViewController.h"
#import "LGBasicInfoStyle02View.h"
@interface LGContactInfomationViewController ()
@property (nonatomic, strong)UIButton *backBtn;
@property (nonatomic, strong)UIScrollView *scrollview;
@property (nonatomic, strong)UIView *scrolviewContentView;
@property (nonatomic, strong)UIButton *confirmBtn;
@end

@implementation LGContactInfomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor jk_colorWithHexString:@"F1F5F9"];
    [self setUpView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)setUpView{
    UILabel *topTitleLabel = [[UILabel alloc] init];
    topTitleLabel.text = @"Basic Informatin";
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
    
    self.confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.confirmBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.confirmBtn setTitle:@"CONFIRM" forState:UIControlStateNormal];
    [self.confirmBtn setBackgroundColor:mainColor];
    self.confirmBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.confirmBtn.layer.cornerRadius = 25.f;
    [self.view addSubview:self.confirmBtn];
    [self.confirmBtn yb_addShadowWithColor:mainColor];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(28);
        make.right.mas_offset(-28);
        make.height.mas_equalTo(50);
        make.bottom.mas_offset(-28);
    }];
    
    self.scrollview = [[UIScrollView alloc] init];
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.showsHorizontalScrollIndicator = NO;
    if(@available(iOS 11.0,*)){
        self.scrollview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.scrollview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollview];
    [self.scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.bottom.mas_equalTo(self.confirmBtn.mas_top).mas_offset(-18);
        make.top.mas_equalTo(topTitleLabel.mas_bottom).mas_offset(16);
    }];
    
    self.scrolviewContentView = [[UIView alloc] init];
    self.scrolviewContentView.backgroundColor = [UIColor clearColor];
    self.scrolviewContentView.layer.cornerRadius = 16.f;
    self.scrolviewContentView.clipsToBounds = YES;
    [self.scrollview addSubview:self.scrolviewContentView];
    [self.scrolviewContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_offset(0);
        make.left.mas_offset(15);
        make.width.mas_equalTo(SCREEN_WIDTH - 30);
    }];
    
    UIView *lastView;
    for(int i=0;i<6;i++){
        LGBasicInfoStyle02View *infoView = [[LGBasicInfoStyle02View alloc] initWithFrame:CGRectZero];
        [self.scrolviewContentView addSubview:infoView];
        [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_offset(0);
            if(lastView){
                make.top.mas_equalTo(lastView.mas_bottom).mas_offset(15);
            }else{
                make.top.mas_offset(0);
            }
            if(i == 5){
                make.bottom.mas_offset(0);
            }
        }];
        lastView = infoView;
    }
}

-(void)backAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)confirmAction:(UIButton *)sender{
    
}
@end
