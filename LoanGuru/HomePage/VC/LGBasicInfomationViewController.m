//
//  LGBasicInfomationViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/3/2.
//

#import "LGBasicInfomationViewController.h"
#import "LGBasicInfoStyle01View.h"
#import "LGEnumAlertView.h"
@interface LGBasicInfomationViewController ()
@property (nonatomic, strong)UIButton *backBtn;
@property (nonatomic, strong)UIScrollView *scrollview;
@property (nonatomic, strong)UIView *scrolviewContentView;
@property (nonatomic, strong)UIButton *confirmBtn;
@property (nonatomic, strong)NSArray *fillInfoTitleArr;
@end

@implementation LGBasicInfomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor jk_colorWithHexString:@"F1F5F9"];
    self.fillInfoTitleArr = @[@"Email",@"Email",@"Email",@"Email"];
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
    self.scrolviewContentView.backgroundColor = [UIColor whiteColor];
    self.scrolviewContentView.layer.cornerRadius = 16.f;
    self.scrolviewContentView.clipsToBounds = YES;
    [self.scrollview addSubview:self.scrolviewContentView];
    [self.scrolviewContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_offset(0);
        make.left.mas_offset(15);
        make.width.mas_equalTo(SCREEN_WIDTH - 30);
    }];
    
    for(int i=0;i<self.fillInfoTitleArr.count;i++){
        LGBasicInfoStyle01View *infoView = [[LGBasicInfoStyle01View alloc] initWithFrame:CGRectZero titleStr:_fillInfoTitleArr[i] type:@"enum"];
        infoView.userInteractionEnabled = YES;
        [self.scrolviewContentView addSubview:infoView];
        [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(29);
            make.right.mas_offset(-29);
            make.top.mas_offset(78*i + 10);
            make.height.mas_equalTo(78);
            if(i == self.fillInfoTitleArr.count - 1){
                make.bottom.mas_offset(-18);
            }
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemSelectAction:)];
        [infoView addGestureRecognizer:tap];
    }
}

-(void)itemSelectAction:(UIGestureRecognizer *)ges{
    NSArray *itemArr = @[@"cancel",@"cancel",@"cancel",@"cancel"];
    LGEnumAlertView *enumAlertView = [[LGEnumAlertView alloc] initWithFrame:self.view.bounds style:LGCommonAlertStyle itemArr:itemArr];
    [self.view addSubview:enumAlertView];
}

-(void)backAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)confirmAction:(UIButton *)sender{
}
@end
