//
//  LGBasicInfoStyle02View.m
//  LoanGuru
//
//  Created by Apple on 2023/3/2.
//

#import "LGBasicInfoStyle02View.h"

@implementation LGBasicInfoStyle02View
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _fillInfoArr = @[@"Relationship",@"Phone Number"];
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    self.backgroundColor = [UIColor clearColor];
    
    self.contentView = [[UIView alloc] init];
    self.contentView.layer.cornerRadius = 16.f;
    self.contentView.clipsToBounds = YES;
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.top.mas_offset(0);
    }];
    
    self.contactTitleLabel = [[UILabel alloc] init];
    self.contactTitleLabel.text = @"Contact emergency contact 1";
    self.contactTitleLabel.font = [UIFont boldSystemFontOfSize:16.f];
    self.contactTitleLabel.textColor = mainColor;
    [self.contentView addSubview:self.contactTitleLabel];
    [self.contactTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(29);
        make.top.mas_offset(22);        
    }];
    
    for(int i=0;i<self.fillInfoArr.count;i++){
        LGBasicInfoStyle01View *infoView = [[LGBasicInfoStyle01View alloc] initWithFrame:CGRectZero titleStr:_fillInfoArr[i] type:@"txt"];
        [self.contentView addSubview:infoView];
        [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(29);
            make.right.mas_offset(-29);
            make.top.mas_equalTo(self.contactTitleLabel.mas_bottom).mas_offset(78*i);
            make.height.mas_equalTo(78);
            if(i == self.fillInfoArr.count - 1){
                make.bottom.mas_offset(-28);
            }
        }];
    }
}
@end
