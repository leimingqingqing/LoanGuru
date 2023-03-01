//
//  LGTabbar.m
//  LoanGuru
//
//  Created by Apple on 2023/2/27.
//

#import "LGTabbar.h"

@implementation LGTabbar
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self yb_addShadowWithColor:[UIColor lightGrayColor]];
        [self setBackgroundImage:[UIImage new]];
        [self setShadowImage:[UIImage new]];
        self.tintColor = [UIColor jk_colorWithHexString:@"0C7472"];
        [self setUnselectedItemTintColor:[UIColor jk_colorWithHexString:@"BED3D3"]];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.frame = CGRectMake(15, SCREEN_HEIGHT - 56 - 15, SCREEN_WIDTH - 30, 56);
    self.layer.cornerRadius = 16;
    self.clipsToBounds = YES;
}

-(void)setFrame:(CGRect)frame{
    CGRect newFrame = CGRectMake(15, SCREEN_HEIGHT - 56 - 15, SCREEN_WIDTH - 30, 56);
    [super setFrame:newFrame];
}
@end
