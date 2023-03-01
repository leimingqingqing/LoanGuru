//
//  UIView+YBExpend.m
//  youonBikePlanA
//
//  Created by LPC on 2017/12/22.
//  Copyright © 2017 audi. All rights reserved.
//

#import "UIView+LGExpend.h"

@implementation UIView (LGExpend)

- (void)yb_addShadowWithColor:(UIColor *)shadowColor{
    [self jk_shadowWithColor:shadowColor offset:CGSizeMake(8, 8) opacity:0.3 radius:10];
}

- (void)drawViewWithWidthArray:(NSArray *)pointWidthArray heightArray:(NSArray *)pointHeightArray {
     if (pointWidthArray.count != pointHeightArray.count || pointWidthArray.count == 0) {
          return;
     }
     CAShapeLayer *layer = [CAShapeLayer layer];
     UIBezierPath *bezier = [UIBezierPath bezierPath];
     [bezier moveToPoint:CGPointMake(0, 0)];
     for (NSInteger i = 0; i < pointWidthArray.count; i++) {
          CGPoint point = CGPointMake([pointWidthArray[i] floatValue], [pointHeightArray[i] floatValue]);
          [bezier addLineToPoint:point];
     }
     [bezier addLineToPoint:CGPointMake(0, 0)];
     layer.path = bezier.CGPath;
     layer.fillColor = UIColor.clearColor.CGColor;
     [self.layer addSublayer:layer];
}

+ (instancetype)viewFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
