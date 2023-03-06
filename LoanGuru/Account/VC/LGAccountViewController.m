//
//  LGAccountViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/2/27.
//

#import "LGAccountViewController.h"
#import "LGAccountCell.h"
#import "LGSetViewController.h"
static NSString *identifier = @"LGAccountCell";
@interface LGAccountViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)UIImageView *topBgImageView;
@property (nonatomic, strong)UIView *tableViewHeaderView;
@property (nonatomic, strong)UIImageView *headIcon;
@property (nonatomic, strong)UILabel *nickNameLabel;
@end

@implementation LGAccountViewController

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
        make.height.mas_equalTo(height(231));
    }];
    
    [self.view addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(self.tableViewHeaderView.mas_bottom).mas_offset(12);
        make.bottom.mas_offset(-80);
    }];
}

-(UIView *)tableViewHeaderView{
    if(!_tableViewHeaderView){
        _tableViewHeaderView = [[UIView alloc] init];
        _tableViewHeaderView.backgroundColor = [UIColor clearColor];
        
        self.topBgImageView = [[UIImageView alloc] init];
        self.topBgImageView.image = [UIImage imageNamed:@"account_topBg"];
        [_tableViewHeaderView addSubview:self.topBgImageView];
        [self.topBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_offset(0);
        }];
        
        self.headIcon = [[UIImageView alloc] init];
        self.headIcon.image = [UIImage imageNamed:@"account_head"];
        [_tableViewHeaderView addSubview:self.headIcon];
        [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tableViewHeaderView);
            make.centerY.mas_equalTo(self.tableViewHeaderView).mas_offset(-20);
        }];
        
        NSString *nickName = @"18389507756";
        self.nickNameLabel = [[UILabel alloc] init];
        self.nickNameLabel.text = [nickName replaceStringWithAsteriskStartLocation:3 lenght:4];
        self.nickNameLabel.font = [UIFont systemFontOfSize:14.f];
        self.nickNameLabel.textColor = [UIColor whiteColor];
        [_tableViewHeaderView addSubview:self.nickNameLabel];
        [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.headIcon);
            make.top.mas_equalTo(self.headIcon.mas_bottom).mas_offset(12);
        }];
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
        [_tableview registerClass:[LGAccountCell class] forCellReuseIdentifier:identifier];
    }
    return _tableview;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LGAccountCell *cell = (LGAccountCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
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
           
        }
            break;
        case 1:{
           
           }
            break;
        case 2:{
           
        }
            
            break;
        case 3:{
          
        }
            break;
        case 4:{
            LGSetViewController *vc = [LGSetViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
