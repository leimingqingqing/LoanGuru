//
//  LGTabbarController.m
//  LoanGuru
//
//  Created by Apple on 2023/2/27.
//

#import "LGTabbarController.h"
#import "LGTabbar.h"
#import "LGNavigationController.h"
@interface LGTabbarController ()

@end

@implementation LGTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    LGTabbar *tabbar = [[LGTabbar alloc] initWithFrame:CGRectZero];
    [self setValue:tabbar forKey:@"tabBar"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
     
     childController.title = title;
     
     childController.tabBarItem.title = title;
     
     childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor jk_colorWithHex:0x0C7472]} forState:UIControlStateSelected];
     childController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -8, 0);
     childController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 8);
     LGNavigationController *nav = [[LGNavigationController alloc] initWithRootViewController:childController];
     [self addChildViewController:nav];
}
@end

