//
//  LGRepayCell.m
//  LoanGuru
//
//  Created by Apple on 2023/3/3.
//

#import "LGRepayCell.h"

@implementation LGRepayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.layer.cornerRadius = 16.f;
    self.contentView.clipsToBounds = YES;
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFrame:(CGRect)frame{
    frame.origin.x += 15;
    frame.size.width -= 30;
    [super setFrame:frame];
}
@end
