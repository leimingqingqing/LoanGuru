//
//  LGTabbarController.h
//  LoanGuru
//
//  Created by Apple on 2023/2/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGTabbarController : UITabBarController

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

@end

NS_ASSUME_NONNULL_END
