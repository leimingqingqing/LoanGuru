//
//  LGConfirmCardInfoAlertView.m
//  LoanGuru
//
//  Created by Apple on 2023/2/28.
//

#import "LGConfirmCardInfoAlertView.h"
#import <TPKeyboardAvoidingTableView.h>
@interface LGConfirmCardInfoAlertView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic)LGAuthConfirmCardInfoAlertStyle style;
@property (nonatomic, strong)TPKeyboardAvoidingTableView *tableview;
@property (nonatomic, strong)UIView *tableHeaderView;
@property (nonatomic, strong)UIView *contentView;
@property (nonatomic, strong)UILabel *topTitleLabel;
@property (nonatomic, strong)UIButton *closeBtn;
@property (nonatomic, strong)UIButton *confirmBtn;
@property (nonatomic, strong)NSArray *frontInfoFillTitleArr;
@property (nonatomic, strong)NSArray *panInfoFillTitleArr;
@end
@implementation LGConfirmCardInfoAlertView

-(instancetype)initWithFrame:(CGRect)frame style:(LGAuthConfirmCardInfoAlertStyle)style{
    self = [super initWithFrame:frame];
    if(self){
        _style = style;
        self.panInfoFillTitleArr = @[@"PAN Card Number",@"PAN Name",@"PAN Father’s Name",@"PAN Birthday"];
        self.frontInfoFillTitleArr = @[@"Aadhaar Name",@"Aadhaar Number",@"Aadhaar Birthday"];
        [self setUpView];
    }
    return self;
}

-(UITableView *)tableview{
    if(!_tableview){
        _tableview = [[TPKeyboardAvoidingTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.showsHorizontalScrollIndicator = NO;
        _tableview.backgroundColor = [UIColor clearColor];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            _tableview.contentInsetAdjustmentBehavior = NO;
        }
        _tableview.tableHeaderView = self.tableHeaderView;
    }
    return _tableview;
}


-(void)setUpView{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    
    [self addSubview:self.tableview];
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_offset(0);
    }];
}

-(UIView *)tableHeaderView{
    if(!_tableHeaderView){
        _tableHeaderView = [[UIView alloc] init];
        _tableHeaderView.backgroundColor = [UIColor clearColor];
        _tableHeaderView.jk_height = SCREEN_HEIGHT;
        
        self.contentView = [[UIView alloc] init];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.layer.cornerRadius = 16.f;
        self.contentView.clipsToBounds = YES;
        [_tableHeaderView addSubview:self.contentView];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width(292));
            make.centerY.mas_equalTo(self.tableHeaderView).mas_offset(-12);
            make.centerX.mas_equalTo(self.tableHeaderView);
        }];
        
        self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.closeBtn addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.closeBtn setImage:[UIImage imageNamed:@"home_auth_alertCloseIcon"] forState:UIControlStateNormal];
        [_tableHeaderView addSubview:self.closeBtn];
        [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(38);
            make.top.mas_equalTo(self.contentView.mas_bottom).mas_offset(15);
            make.centerX.mas_equalTo(self.tableHeaderView);
        }];
        
        self.topTitleLabel = [[UILabel alloc] init];
        self.topTitleLabel.textColor = [UIColor jk_colorWithHexString:@"333333"];
        self.topTitleLabel.font = [UIFont boldSystemFontOfSize:18.f];
        [self.contentView addSubview:self.topTitleLabel];
        [self.topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView);
            make.top.mas_offset(23);
        }];
        
        UIView *lastView;
        if(_style == LGConfirmFrontAlertStyle){
            self.topTitleLabel.text = @"Provincial certificate";
            for(int i=0;i<self.frontInfoFillTitleArr.count;i++){
                LGCardFillInfoItem *item = [[LGCardFillInfoItem alloc] initWithFrame:CGRectZero titleStr:self.frontInfoFillTitleArr[i]];
                [self.contentView addSubview:item];
                [item mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_offset(14);
                    make.right.mas_offset(-14);
                    make.height.mas_equalTo(78);
                    make.top.mas_equalTo(self.topTitleLabel.mas_bottom).mas_offset(78*i + 10);
                }];
                if(i == self.frontInfoFillTitleArr.count - 1){
                    lastView = item;
                }
            }
        }else{
            self.topTitleLabel.text = @"Pan Card";
            for(int i=0;i<self.panInfoFillTitleArr.count;i++){
                LGCardFillInfoItem *item = [[LGCardFillInfoItem alloc] initWithFrame:CGRectZero titleStr:self.panInfoFillTitleArr[i]];
                [self.contentView addSubview:item];
                [item mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_offset(14);
                    make.right.mas_offset(-14);
                    make.height.mas_equalTo(78);
                    make.top.mas_equalTo(self.topTitleLabel.mas_bottom).mas_offset(78*i + 10);
                }];

                if(i == self.panInfoFillTitleArr.count - 1){
                    lastView = item;
                }
            }
        }

        self.confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.confirmBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.confirmBtn setTitle:@"CONFIRM" forState:UIControlStateNormal];
        [self.confirmBtn setBackgroundColor:mainColor];
        self.confirmBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [self.confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.confirmBtn.layer.cornerRadius = 25.f;
        [self.contentView addSubview:self.confirmBtn];
        [self.confirmBtn yb_addShadowWithColor:mainColor];
        [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(18);
            make.right.mas_offset(-18);
            make.height.mas_equalTo(50);
            make.top.mas_equalTo(lastView.mas_bottom).mas_offset(28);
            make.bottom.mas_offset(-28);
        }];
    }
    return _tableHeaderView;
}

-(void)closeAction:(UIButton *)sender{
    [self removeFromSuperview];
}

-(void)confirmAction:(UIButton *)sender{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
@end

@implementation LGCardFillInfoItem

-(instancetype)initWithFrame:(CGRect)frame titleStr:(NSString *)titleStr{
    self = [super initWithFrame:frame];
    if(self){
        _titleStr = titleStr;
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    self.fillTitleLabel = [[UILabel alloc] init];
    self.fillTitleLabel.textColor = [UIColor jk_colorWithHexString:@"888888"];
    self.fillTitleLabel.font = [UIFont systemFontOfSize:15.f];
    self.fillTitleLabel.text = self.titleStr;
    [self addSubview:self.fillTitleLabel];
    [self.fillTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.mas_offset(10);
    }];
    
    self.fillBgView = [[UIView alloc] init];
    self.fillBgView.backgroundColor = mainLightColor;
    self.fillBgView.layer.cornerRadius = 8.0f;
    self.fillBgView.clipsToBounds = YES;
    [self addSubview:self.fillBgView];
    [self.fillBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.fillTitleLabel);
        make.right.mas_offset(0);
        make.top.mas_equalTo(self.fillTitleLabel.mas_bottom).mas_offset(8);
        make.height.mas_equalTo(38);
    }];
     
    self.fillInfoTextField = [[UITextField alloc] init];
    self.fillInfoTextField.textColor = [UIColor jk_colorWithHexString:@"333333"];
    self.fillInfoTextField.font = [UIFont boldSystemFontOfSize:14.f];
    [self.fillBgView addSubview:self.fillInfoTextField];
    [self.fillInfoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_offset(0);
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
    }];
}
@end
