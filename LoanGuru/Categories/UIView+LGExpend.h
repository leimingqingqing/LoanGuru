//
//  UIView+YBExpend.h
//  youonBikePlanA
//
//  Created by LPC on 2017/12/22.
//  Copyright © 2017年 audi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LGExpend)

- (void)yb_addShadowWithColor:(UIColor *)shadowColor;

- (void)drawViewWithWidthArray:(NSArray*)pointWidthArray heightArray:(NSArray *)pointHeightArray;

+ (instancetype)viewFromXib;
@end
