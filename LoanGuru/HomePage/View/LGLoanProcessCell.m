//
//  LGLoanProcessCell.m
//  LoanGuru
//
//  Created by Apple on 2023/2/27.
//

#import "LGLoanProcessCell.h"

@implementation LGLoanProcessCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.processView.layer.cornerRadius = 16.f;
    self.processView.clipsToBounds = YES;
    
    UIImageView *firstArrow = [[UIImageView alloc] init];
    firstArrow.image = [UIImage imageNamed:@"home_processArrow"];
    [self.processView addSubview:firstArrow];
    [firstArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.firstView.mas_right);
        make.top.mas_offset(45);
    }];
    
    UIImageView *secondArrow = [[UIImageView alloc] init];
    secondArrow.image = [UIImage imageNamed:@"home_processArrow"];
    [self.processView addSubview:secondArrow];
    [secondArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.secondView.mas_right);
        make.top.mas_offset(45);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
