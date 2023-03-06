//
//  LGSetViewController.h
//  LoanGuru
//
//  Created by Apple on 2023/3/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGSetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *appIcon;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (nonatomic, strong)UIButton *loginOutBtn;
@property (nonatomic, strong)UIButton *cancellationBtn;
@end

NS_ASSUME_NONNULL_END
