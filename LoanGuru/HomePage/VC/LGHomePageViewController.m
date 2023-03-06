//
//  LGHomePageViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/2/27.
//

#import "LGHomePageViewController.h"
#import "LGLoanProcessCell.h"
#import "LGLoanApplyListCell.h"
#import "LGInfoAuthHomePageViewController.h"
#import "LGHomeViewModel.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
typedef enum : NSUInteger {
     LGBeforeApply,
     LGAfterApply,
} LGTableViewStyle;
static NSString *identifier = @"LGLoanProcessCell";
static NSString *identifier01 = @"LGLoanApplyListCell";
@interface LGHomePageViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
{
    LGTableViewStyle _tableviewStyle;
}
@property(nonatomic, strong)UITableView *tableview;
@property(nonatomic, strong)UIView *tableViewHeaderView;
@property(nonatomic, strong)UIImageView *loanIntroduceBgImageView;
@property(nonatomic, strong)UIButton *applyBtn;
@property(nonatomic, strong)UILabel *loanAmountLabel;
@property(nonatomic, strong)UILabel *loanRateLabel;
@property(nonatomic, strong)UILabel *notificationLabel;
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
@end

@implementation LGHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor jk_colorWithHexString:@"F1F5F9"];
    
    _tableviewStyle = LGBeforeApply;
    
    [self.view addSubview:self.tableViewHeaderView];
    [self.tableViewHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(0);
    }];
    
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(self.tableViewHeaderView.mas_bottom);
        make.bottom.mas_offset(-80);
    }];
}

-(void)getHomeInfo{
    [LGHomeViewModel getHomeInfoSuccess:^(LGApiModel * _Nullable dataModel) {
        
    } fail:^(LGApiModel * _Nullable dataModel, NSInteger errorCode) {
        
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self getHomeInfo];
}

-(UIView *)tableViewHeaderView{
    if(!_tableViewHeaderView){
        _tableViewHeaderView = [[UIView alloc] init];
        _tableViewHeaderView.backgroundColor = [UIColor clearColor];
        _tableViewHeaderView.jk_height = 272*SCREEN_WIDTH/375;
        
        UIImageView *topBackgroundImageView = [[UIImageView alloc] init];
        topBackgroundImageView.image = [UIImage imageNamed:@"home_topBg"];
        [_tableViewHeaderView addSubview:topBackgroundImageView];
        [topBackgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_offset(0);
            make.height.mas_equalTo(272*SCREEN_WIDTH/375);
        }];
        
        UILabel *topTitleLabel = [[UILabel alloc] init];
        topTitleLabel.text = @"LoanGuru";
        topTitleLabel.font = [UIFont boldSystemFontOfSize:24.f];
        topTitleLabel.textColor = [UIColor whiteColor];
        [_tableViewHeaderView addSubview:topTitleLabel];
        [topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(14);
            make.top.mas_offset(k_StatusBarHeight + 12);
        }];
        
        self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(15, 94, SCREEN_WIDTH - 30, (SCREEN_WIDTH - 30)*120/345) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        self.cycleScrollView.localizationImageNamesGroup = @[@"home_topIntroducePic"];
        self.cycleScrollView.delegate = self;
        self.cycleScrollView.autoScrollTimeInterval = 5;
        self.cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        self.cycleScrollView.currentPageDotImage = [UIImage imageNamed:@""];
        self.cycleScrollView.pageDotImage = [UIImage imageNamed:@""];
        self.cycleScrollView.layer.cornerRadius = 16;
        self.cycleScrollView.layer.masksToBounds = YES;
        [_tableViewHeaderView addSubview:self.cycleScrollView];
        [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.top.mas_equalTo(topTitleLabel.mas_bottom).mas_offset(14);
            make.right.mas_offset(-15);
            make.height.mas_equalTo((SCREEN_WIDTH - 30)*120/345);
        }];
        
        if(_tableviewStyle == LGBeforeApply){
            self.loanIntroduceBgImageView = [[UIImageView alloc] init];
            self.loanIntroduceBgImageView.image = [UIImage imageNamed:@"home_loanIntroduceBg"];
            [_tableViewHeaderView addSubview:self.loanIntroduceBgImageView];
            [self.loanIntroduceBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(15);
                make.right.mas_offset(-15);
                make.top.mas_equalTo(self.cycleScrollView.mas_bottom).mas_offset(24);
                make.height.mas_equalTo(height(190));
            }];
            
            self.applyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.applyBtn addTarget:self action:@selector(applyAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.applyBtn setTitle:@"Apply  Now" forState:UIControlStateNormal];
            [self.applyBtn setBackgroundColor:mainColor];
            self.applyBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
            [self.applyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.applyBtn.layer.cornerRadius = 25.f;
            [_tableViewHeaderView addSubview:self.applyBtn];
            [self.applyBtn yb_addShadowWithColor:mainColor];
            [self.applyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(58);
                make.right.mas_offset(-58);
                make.height.mas_equalTo(50);
                make.centerY.mas_equalTo(self.loanIntroduceBgImageView.mas_bottom);
                make.bottom.mas_offset(-24);
            }];
            
            UILabel *maximumTitleLabel = [[UILabel alloc] init];
            maximumTitleLabel.text = @"Maximum Borrowable";
            maximumTitleLabel.textColor = [UIColor jk_colorWithHexString:@"888888"];
            maximumTitleLabel.font = [UIFont systemFontOfSize:12.f];
            [_tableViewHeaderView addSubview:maximumTitleLabel];
            [maximumTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.loanIntroduceBgImageView.mas_top).mas_offset(25);
                make.centerX.mas_equalTo(self.loanIntroduceBgImageView);
            }];
            
            self.loanAmountLabel = [[UILabel alloc] init];
            self.loanAmountLabel.text = @"₹60,000,000";
            self.loanAmountLabel.font = [UIFont boldSystemFontOfSize:34.f];
            self.loanAmountLabel.textColor = [UIColor jk_colorWithHexString:@"333333"];
            [_tableViewHeaderView addSubview:self.loanAmountLabel];
            [self.loanAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self.loanIntroduceBgImageView);
                make.top.mas_equalTo(maximumTitleLabel.mas_bottom).mas_offset(25);
            }];
            
            self.loanRateLabel = [[UILabel alloc] init];
            self.loanRateLabel.textColor = [UIColor jk_colorWithHexString:@"333333"];
            self.loanRateLabel.font = [UIFont systemFontOfSize:15.f];
            NSString *rateStr = @"Interest rate 0.05% day";
            NSMutableAttributedString *rateAttriStr = [[NSMutableAttributedString alloc] initWithString:rateStr];
            NSRange range = [rateStr rangeOfString:@"0.05%"];
            [rateAttriStr addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15.f],NSForegroundColorAttributeName:[UIColor jk_colorWithHexString:@"FDAD00"]} range:range];
            self.loanRateLabel.attributedText = rateAttriStr;
            [_tableViewHeaderView addSubview:self.loanRateLabel];
            [self.loanRateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self.loanIntroduceBgImageView);
                make.top.mas_equalTo(self.loanAmountLabel.mas_bottom).mas_offset(25);
            }];
        }else{
            UIView *notificationView = [[UIView alloc] init];
            notificationView.layer.cornerRadius = 25.f;
            notificationView.clipsToBounds = YES;
            notificationView.backgroundColor = [UIColor whiteColor];
            [_tableViewHeaderView addSubview:notificationView];
            [notificationView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(15);
                make.right.mas_offset(-15);
                make.height.mas_equalTo(50);
                make.centerY.mas_equalTo(topBackgroundImageView.mas_bottom).mas_offset(-18);
                make.bottom.mas_offset(-15);
            }];
            
            UIImageView *notificationIcon = [[UIImageView alloc] init];
            notificationIcon.image = [UIImage imageNamed:@"home_notification"];
            [notificationView addSubview:notificationIcon];
            [notificationIcon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(7);
                make.centerY.mas_equalTo(notificationView);
            }];
            
            self.notificationLabel = [[UILabel alloc] init];
            self.notificationLabel.text = @"Your quota has increased again.";
            self.notificationLabel.font = [UIFont systemFontOfSize:15.f];
            self.notificationLabel.textColor = [UIColor jk_colorWithHexString:@"444444"];
            [notificationView addSubview:self.notificationLabel];
            [self.notificationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(notificationIcon.mas_right).mas_offset(12);
                make.centerY.mas_equalTo(notificationIcon);
            }];
        }
    }
    return _tableViewHeaderView;
}

-(UITableView *)tableview{
    if(!_tableview){
        _tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.showsHorizontalScrollIndicator = NO;
        _tableview.rowHeight = UITableViewAutomaticDimension;
        _tableview.estimatedRowHeight = 300;
        _tableview.backgroundColor = [UIColor clearColor];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            _tableview.contentInsetAdjustmentBehavior = NO;
        }
        [_tableview registerNib:[UINib nibWithNibName:@"LGLoanProcessCell" bundle:nil] forCellReuseIdentifier:identifier];
        [_tableview registerClass:[LGLoanApplyListCell class] forCellReuseIdentifier:identifier01];
    }
    return _tableview;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_tableviewStyle == LGBeforeApply){
        LGLoanProcessCell *cell = (LGLoanProcessCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
        return cell;
    }else{
        LGLoanApplyListCell *cell = (LGLoanApplyListCell *)[tableView dequeueReusableCellWithIdentifier:identifier01];
        return cell;
    }
}

-(void)applyAction:(UIButton *)sender{
    LGInfoAuthHomePageViewController *authVC = [[LGInfoAuthHomePageViewController alloc] init];
    [self.navigationController pushViewController:authVC animated:YES];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}
@end
