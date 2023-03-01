//
//  LGLoanApplyListCell.m
//  LoanGuru
//
//  Created by Apple on 2023/2/27.
//

#import "LGLoanApplyListCell.h"

@implementation LGLoanApplyListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
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
    NSInteger itemCount = 7;
    CGFloat itemWidth = (SCREEN_WIDTH - 15*3)/2;
    CGFloat itemHeight01 = 155;
    CGFloat itemHeight02 = 174;
    UIView *lastView;
    NSMutableArray *itemArr = [NSMutableArray array];
    for(int i=0;i<itemCount;i++){
        NSInteger row = i%4;
        switch (row) {
            case 0:{
                UIView *firstView = [[UIView alloc] init];
                firstView.backgroundColor = [UIColor whiteColor];
                firstView.layer.cornerRadius = 16.f;
                firstView.clipsToBounds = YES;
                [self.contentView addSubview:firstView];
                if(lastView){
                    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.left.mas_offset(15);
                        make.top.mas_equalTo(lastView.mas_bottom).mas_offset(15);
                        make.width.mas_equalTo(itemWidth);
                        make.height.mas_equalTo(itemHeight01);
                        if(i == itemCount - 1){
                            make.bottom.mas_offset(-14);
                        }
                    }];
                }else{
                    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.left.mas_offset(15);
                        make.top.mas_offset(0);
                        make.width.mas_equalTo(itemWidth);
                        make.height.mas_equalTo(itemHeight01);
                        if(i == itemCount - 1){
                            make.bottom.mas_offset(-14);
                        }
                    }];
                }
                [itemArr addObject:firstView];
               }
                break;
            case 1:{
                 UIView *secondView = [[UIView alloc] init];
                 secondView.backgroundColor = [UIColor jk_colorWithHexString:@"4DB2B2"];
                 secondView.layer.cornerRadius = 16.f;
                 secondView.clipsToBounds = YES;
                 [self.contentView addSubview:secondView];
                 if(lastView){
                    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.right.mas_offset(-15);
                        make.top.mas_equalTo(lastView.mas_bottom).mas_offset(15);
                        make.width.mas_equalTo(itemWidth);
                        make.height.mas_equalTo(itemHeight02);
                        if(i == itemCount - 1){
                            make.bottom.mas_offset(-14);
                        }
                    }];
                 }else{
                    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.right.mas_offset(-15);
                        make.top.mas_offset(0);
                        make.width.mas_equalTo(itemWidth);
                        make.height.mas_equalTo(itemHeight02);
                        if(i == itemCount - 1){
                            make.bottom.mas_offset(-14);
                        }
                    }];
                }
                [itemArr addObject:secondView];
                }
                break;
            case 2:{
                UIView *firstView = itemArr[0];
                UIView *thirdView = [[UIView alloc] init];
                thirdView.backgroundColor = [UIColor jk_colorWithHexString:@"FDAD00"];
                thirdView.layer.cornerRadius = 16.f;
                thirdView.clipsToBounds = YES;
                [self.contentView addSubview:thirdView];
                [thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_offset(15);
                    make.top.mas_equalTo(firstView.mas_bottom).mas_offset(15);
                    make.width.mas_equalTo(itemWidth);
                    make.height.mas_equalTo(itemHeight02);
                    if(i == itemCount - 1){
                        make.bottom.mas_offset(-14);
                    }
                }];
            }
                
                break;
            case 3:{
                UIView *secondView = itemArr[1];
                UIView *forthView = [[UIView alloc] init];
                forthView.backgroundColor = [UIColor whiteColor];
                forthView.layer.cornerRadius = 16.f;
                forthView.clipsToBounds = YES;
                [self.contentView addSubview:forthView];
                [forthView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_offset(-15);
                    make.top.mas_equalTo(secondView.mas_bottom).mas_offset(15);
                    make.width.mas_equalTo(itemWidth);
                    make.height.mas_equalTo(itemHeight01);
                    if(i == itemCount - 1){
                        make.bottom.mas_offset(-14);
                    }
                }];
                [itemArr removeAllObjects];
                lastView = forthView;
            }
                break;
            default:
                break;
        }
    }
}
@end
