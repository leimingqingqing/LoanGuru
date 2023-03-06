//
//  LGInfoAuthHomePageViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/2/27.
//

#import "LGInfoAuthHomePageViewController.h"
#import "LGInfoAuthTypeCell.h"
#import "LGBasicInfoCardViewController.h"
#import "LGLivingRecognitionViewController.h"
#import "LGContactInfomationViewController.h"
#import "LGBasicInfomationViewController.h"
static NSString *identifier = @"LGInfoAuthTypeCell";
@interface LGInfoAuthHomePageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIImageView *topBgImageView;
@property (nonatomic, strong)UIView *tableViewHeaderView;
@property (nonatomic, strong)UIButton *backBtn;
@property (nonatomic, strong)UIImageView *percentImageView;
@property (nonatomic, strong)UILabel *topTipLabel;
@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)UIButton *applyBtn;

@end

@implementation LGInfoAuthHomePageViewController

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
    [self.view addSubview:self.tableViewHeaderView];
    [self.tableViewHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(0);
        make.height.mas_equalTo(height(214));
    }];
    
    self.applyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.applyBtn setTitle:@"Apply  Now" forState:UIControlStateNormal];
    [self.applyBtn setBackgroundColor:mainColor];
    self.applyBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.applyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.applyBtn.layer.cornerRadius = 25.f;
    [self.view addSubview:self.applyBtn];
    [self.applyBtn addTarget:self action:@selector(applyAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.applyBtn yb_addShadowWithColor:mainColor];
    [self.applyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(40);
        make.right.mas_offset(-40);
        make.height.mas_equalTo(50);
        make.bottom.mas_offset(-20);
    }];
    
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(self.tableViewHeaderView.mas_bottom).mas_offset(28);
        make.bottom.mas_offset(-90);
    }];
}

#pragma mark -  申请
-(void)applyAction:(UIButton *)sender{
    
}

-(UIView *)tableViewHeaderView{
    if(!_tableViewHeaderView){
        _tableViewHeaderView = [[UIView alloc] init];
        _tableViewHeaderView.backgroundColor = [UIColor clearColor];
        
        self.topBgImageView = [[UIImageView alloc] init];
        self.topBgImageView.image = [UIImage imageNamed:@"home_auth_topBg"];
        [_tableViewHeaderView addSubview:self.topBgImageView];
        [self.topBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_offset(0);
        }];
        
        UILabel *topTitleLabel = [[UILabel alloc] init];
        topTitleLabel.text = @"LoanGuru";
        topTitleLabel.textColor = [UIColor whiteColor];
        topTitleLabel.font = [UIFont boldSystemFontOfSize:18.f];
        [_tableViewHeaderView addSubview:topTitleLabel];
        [topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(k_StatusBarHeight+7);
            make.centerX.mas_equalTo(self.tableViewHeaderView);
        }];
        
        self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.backBtn setImage:[UIImage imageNamed:@"home_auth_back"] forState:UIControlStateNormal];
        [_tableViewHeaderView addSubview:self.backBtn];
        [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.centerY.mas_equalTo(topTitleLabel);
            make.width.height.mas_equalTo(26);
        }];
        
        self.percentImageView = [[UIImageView alloc] init];
        self.percentImageView.image = [UIImage imageNamed:@"home_auth_per100"];
        [_tableViewHeaderView addSubview:self.percentImageView];
        [self.percentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(36);
            make.top.mas_offset(k_StatusBarHeight+59);
        }];
        
        self.topTipLabel = [[UILabel alloc] init];
        self.topTipLabel.numberOfLines = 0;
        self.topTipLabel.textColor = [UIColor whiteColor];
        self.topTipLabel.text = @"Please provide the following information so that we can offer you faster and more accurate service.";
        self.topTipLabel.font = [UIFont systemFontOfSize:14.f];
        [_tableViewHeaderView addSubview:self.topTipLabel];
        [self.topTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.percentImageView.mas_right).mas_offset(16);
            make.top.mas_offset(k_StatusBarHeight+69);
            make.right.mas_offset(-35);
        }];
    }
    return _tableViewHeaderView;
}

-(void)backAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
        [_tableview registerClass:[LGInfoAuthTypeCell class] forCellReuseIdentifier:identifier];
    }
    return _tableview;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LGInfoAuthTypeCell *cell = (LGInfoAuthTypeCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    @weakify(self)
    cell.itemClickBlock = ^(NSInteger itemIndex) {
        @strongify(self)
        [self selectItemWithIndex:itemIndex];
    };
    return cell;
}

-(void)selectItemWithIndex:(NSInteger)itemIndex{
    switch (itemIndex) {
        case 0:{
            LGBasicInfoCardViewController *fillCardInfoVC = [[LGBasicInfoCardViewController alloc] init];
            [self.navigationController pushViewController:fillCardInfoVC animated:YES];
        }
            break;
        case 1:{
            LGLivingRecognitionViewController *vc = [[LGLivingRecognitionViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
           }
            break;
        case 2:{
            LGBasicInfomationViewController *vc = [[LGBasicInfomationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 3:{
            LGContactInfomationViewController *vc = [[LGContactInfomationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:{
            LGBasicInfomationViewController *vc = [[LGBasicInfomationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
