//
//  LGRepayViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/2/27.
//

#import "LGRepayViewController.h"
#import "LGRepayCell.h"
static NSString *identifier = @"LGRepayCell";
@interface LGRepayViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)UIImageView *bgImageView;
@property (nonatomic, strong)UILabel *topTiplabel;
@property (nonatomic, strong)UIButton *notYetRepaidBtn;
@property (nonatomic, strong)UIButton *applyingBtn;
@property (nonatomic, strong)UIButton *repayedBtn;
@property (nonatomic, strong)UIButton *selectedBtn;
@property (nonatomic, strong)UIImageView *emptyDataTipIcon;
@property (nonatomic, strong)UILabel *emptyDataTipLabel;
@property (nonatomic, strong)UIView *emptyContentView;
@end

@implementation LGRepayViewController

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
    self.bgImageView = [[UIImageView alloc] init];
    self.bgImageView.backgroundColor = mainColor;
    [self.view addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(0);
        make.height.mas_equalTo(211);
    }];
    
    UILabel *topTitleLabel = [[UILabel alloc] init];
    topTitleLabel.text = @"Loan Records";
    topTitleLabel.textColor = [UIColor whiteColor];
    topTitleLabel.font = [UIFont boldSystemFontOfSize:18.f];
    [self.view addSubview:topTitleLabel];
    [topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(k_StatusBarHeight+7);
        make.centerX.mas_equalTo(self.view);
    }];
    
    self.notYetRepaidBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.notYetRepaidBtn.tag = 100;
    [self.notYetRepaidBtn addTarget:self action:@selector(changeStateAction:) forControlEvents:UIControlEventTouchUpInside];
    self.notYetRepaidBtn.layer.cornerRadius = 19.f;
    [self.notYetRepaidBtn setTitle:@"Not Yet Repaid" forState:UIControlStateNormal];
    [self.notYetRepaidBtn setBackgroundColor:[[UIColor jk_colorWithHexString:@"E6F1F1"] colorWithAlphaComponent:0.5]];
    [self.notYetRepaidBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.notYetRepaidBtn setTitleColor:mainColor forState:UIControlStateSelected];
    self.notYetRepaidBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.view addSubview:self.notYetRepaidBtn];
    [self.notYetRepaidBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.width.mas_equalTo(width(136));
        make.height.mas_equalTo(38);
        make.top.mas_equalTo(topTitleLabel.mas_bottom).mas_offset(20);
    }];
    self.selectedBtn = self.notYetRepaidBtn;
    
    self.repayedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.repayedBtn.tag = 101;
    [self.repayedBtn addTarget:self action:@selector(changeStateAction:) forControlEvents:UIControlEventTouchUpInside];
    self.repayedBtn.layer.cornerRadius = 19.f;
    [self.repayedBtn setTitle:@"Repayed" forState:UIControlStateNormal];
    [self.repayedBtn setBackgroundColor:[[UIColor jk_colorWithHexString:@"E6F1F1"] colorWithAlphaComponent:0.5]];
    [self.repayedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.repayedBtn setTitleColor:mainColor forState:UIControlStateSelected];
    self.repayedBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.view addSubview:self.repayedBtn];
    [self.repayedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.width.mas_equalTo(width(98));
        make.height.mas_equalTo(38);
        make.top.mas_equalTo(topTitleLabel.mas_bottom).mas_offset(20);
    }];
    
    self.applyingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.applyingBtn.tag = 102;
    [self.applyingBtn addTarget:self action:@selector(changeStateAction:) forControlEvents:UIControlEventTouchUpInside];
    self.applyingBtn.layer.cornerRadius = 19.f;
    [self.applyingBtn setTitle:@"Applying" forState:UIControlStateNormal];
    [self.applyingBtn setBackgroundColor:[[UIColor jk_colorWithHexString:@"E6F1F1"] colorWithAlphaComponent:0.5]];
    [self.applyingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.applyingBtn setTitleColor:mainColor forState:UIControlStateSelected];
    self.applyingBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.view addSubview:self.applyingBtn];
    [self.applyingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.notYetRepaidBtn.mas_right).mas_offset(8);
        make.right.mas_equalTo(self.repayedBtn.mas_left).mas_offset(-8);
        make.height.mas_equalTo(38);
        make.top.mas_equalTo(topTitleLabel.mas_bottom).mas_offset(20);
    }];
    
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.bottom.mas_offset(-80);
        make.top.mas_equalTo(self.notYetRepaidBtn.mas_bottom).mas_offset(20);
    }];
    
    [self setUpEmptyDataView];
}

-(void)setUpEmptyDataView{
    self.emptyContentView = [[UIView alloc] init];
    self.emptyContentView.backgroundColor = [UIColor whiteColor];
    self.emptyContentView.layer.cornerRadius = 16.f;
    self.emptyContentView.clipsToBounds = YES;
    [self.view addSubview:self.emptyContentView];
    [self.emptyContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.top.mas_equalTo(self.repayedBtn.mas_bottom).mas_offset(15);
        make.right.mas_offset(-15);
        make.bottom.mas_offset(-100);
    }];
    
    self.emptyDataTipIcon = [[UIImageView alloc] init];
    self.emptyDataTipIcon.image = [UIImage imageNamed:@"repay_emptyIcon"];
    [self.emptyContentView addSubview:self.emptyDataTipIcon];
    [self.emptyDataTipIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.emptyContentView);
        make.centerY.mas_equalTo(self.emptyContentView).mas_offset(-20);
    }];
    
    self.emptyDataTipLabel = [[UILabel alloc] init];
    self.emptyDataTipLabel.text = @"No Records";
    self.emptyDataTipLabel.font = [UIFont boldSystemFontOfSize:14.f];
    self.emptyDataTipLabel.textColor = [UIColor jk_colorWithHexString:@"888888"];
    [self.emptyContentView addSubview:self.emptyDataTipLabel];
    [self.emptyDataTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.emptyDataTipIcon.mas_bottom).mas_offset(46);
        make.centerX.mas_equalTo(self.emptyContentView);
    }];
}

-(void)setSelectedBtn:(UIButton *)selectedBtn{
    if(_selectedBtn){
        _selectedBtn.selected = NO;
        [_selectedBtn setBackgroundColor:[[UIColor jk_colorWithHexString:@"E6F1F1"] colorWithAlphaComponent:0.5]];
    }
    _selectedBtn = selectedBtn;
    [_selectedBtn setBackgroundColor:[UIColor whiteColor]];
    _selectedBtn.selected = YES;
}

-(UITableView *)tableview{
    if(!_tableview){
        _tableview = [[UITableView alloc] initWithFrame:CGRectZero];
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
        if (@available(iOS 15.0, *)) {
            _tableview.sectionHeaderTopPadding = 0;
        }
        [_tableview registerNib:[UINib nibWithNibName:@"LGRepayCell" bundle:nil] forCellReuseIdentifier:identifier];
    }
    return _tableview;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LGRepayCell *cell = (LGRepayCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15.f;
}

-(void)changeStateAction:(UIButton *)btn{
    self.selectedBtn = btn;
}
@end
