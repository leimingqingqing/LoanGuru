//
//  LGEnumAlertView.m
//  LoanGuru
//
//  Created by Apple on 2023/3/2.
//

#import "LGEnumAlertView.h"

@implementation LGEnumAlertView
-(instancetype)initWithFrame:(CGRect)frame style:(LGBottomAlertStyle)style itemArr:(NSArray *)itemArr{
    self = [super initWithFrame:frame];
    if(self){
        self.itemArr = itemArr;
        self.alertStyle = style;
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 16.f;
    self.contentView.clipsToBounds = YES;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.bottom.mas_offset(10);
        make.height.mas_equalTo(306);
    }];
    
    if(self.alertStyle == LGCommonAlertStyle){
        
    }else{
        
    }
}
@end
