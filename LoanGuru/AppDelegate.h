//
//  AppDelegate.h
//  LoanGuru
//
//  Created by Apple on 2023/2/24.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic ,strong)UIWindow *window;
@property (nonatomic, assign) BOOL isAutoRotation;
-(void)goToLoginPage;
-(void)goToHomePage;
@end

