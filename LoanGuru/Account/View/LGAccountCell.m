//
//  LGAccountCell.m
//  LoanGuru
//
//  Created by Apple on 2023/3/3.
//

#import "LGAccountCell.h"

@implementation LGAccountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
     if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         self.selectionStyle = UITableViewCellSelectionStyleNone;
         self.contentView.backgroundColor = [UIColor clearColor];
         self.backgroundColor = [UIColor clearColor];
         [self setUpView];
     }
     return self;
}

-(void)setUpView{
    NSArray *authIconArr = @[@"account_icon01",@"account_icon02",@"account_icon03",@"account_icon04",@"account_icon05"];
    NSArray *authTitleArr = @[@"Loan record",@"Privacy agreement",@"Loan agreement",@"Contact us",@"set"];
    CGFloat itemWidth = (SCREEN_WIDTH - 45)/2;
    CGFloat itemHeight = 114;
    for(int i=0;i<5;i++){
        if(i<4){
            int row = i/2;
            int col = i%2;
            LGAccountItemOne *item = [[LGAccountItemOne alloc] init];
            item.tag = i;
            item.backgroundColor = [UIColor whiteColor];
            item.layer.cornerRadius = 16.f;
            item.itemIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",authIconArr[i]]];
            item.itemTopicLabel.text = authTitleArr[i];
            [self.contentView addSubview:item];
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(15 + (itemWidth + 15)*col);
                make.top.mas_offset((itemHeight + 15)*row);
                make.width.mas_equalTo(itemWidth);
                make.height.mas_equalTo(itemHeight);
            }];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClickAction:)];
            [item addGestureRecognizer:tap];
        }else{
            LGAccountItemTwo *item = [[LGAccountItemTwo alloc] init];
            item.tag = i;
            item.backgroundColor = [UIColor whiteColor];
            item.layer.cornerRadius = 16.f;
            item.itemIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",authIconArr[i]]];
            item.itemTopicLabel.text = authTitleArr[i];
            [self.contentView addSubview:item];
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(15);
                make.top.mas_offset((itemHeight + 15)*2);
                make.right.mas_offset(-15);
                make.height.mas_equalTo(66);
                make.bottom.mas_offset(-20);
            }];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClickAction:)];
            [item addGestureRecognizer:tap];
        }
    }
}

-(void)itemClickAction:(UIGestureRecognizer *)ges{
    if(self.itemClickBlock){
        self.itemClickBlock(ges.view.tag);
    }
}
@end

@implementation LGAccountItemOne
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    self.itemIcon = [[UIImageView alloc] init];
    [self addSubview:self.itemIcon];
    [self.itemIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(25);
        make.centerX.mas_equalTo(self);
        make.width.height.mas_equalTo(41);
    }];
    
    self.itemTopicLabel = [[UILabel alloc] init];
    self.itemTopicLabel.numberOfLines = 2;
    self.itemTopicLabel.textColor = [UIColor jk_colorWithHexString:@"444444"];
    self.itemTopicLabel.font = [UIFont boldSystemFontOfSize:14.f];
    [self addSubview:self.itemTopicLabel];
    [self.itemTopicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.itemIcon.mas_bottom).mas_offset(12);
    }];
}
@end

@implementation LGAccountItemTwo
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    self.itemIcon = [[UIImageView alloc] init];
    [self addSubview:self.itemIcon];
    [self.itemIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.top.mas_offset(13);
        make.width.height.mas_equalTo(41);
    }];
    
    self.itemTopicLabel = [[UILabel alloc] init];
    self.itemTopicLabel.textColor = [UIColor jk_colorWithHexString:@"444444"];
    self.itemTopicLabel.font = [UIFont boldSystemFontOfSize:14.f];
    [self addSubview:self.itemTopicLabel];
    [self.itemTopicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.itemIcon.mas_right).mas_offset(14);
        make.centerY.mas_equalTo(self);
    }];
    
    self.arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.arrowBtn.userInteractionEnabled = NO;
    [self.arrowBtn setImage:[UIImage imageNamed:@"home_auth_fillInfoArrow"] forState:UIControlStateNormal];
    [self.arrowBtn setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.arrowBtn];
    [self.arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-12);
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(20);
    }];
}
@end
