//
//  LGAccountCell.h
//  LoanGuru
//
//  Created by Apple on 2023/3/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGAccountCell : UITableViewCell
@property (nonatomic, copy)void(^itemClickBlock)(NSInteger itemIndex);
@end

@interface LGAccountItemOne : UIView
@property (nonatomic, strong)UIImageView *itemIcon;
@property (nonatomic, strong)UILabel *itemTopicLabel;
@end

@interface LGAccountItemTwo : UIView
@property (nonatomic, strong)UIImageView *itemIcon;
@property (nonatomic, strong)UILabel *itemTopicLabel;
@property (nonatomic, strong)UIButton *arrowBtn;
@end

NS_ASSUME_NONNULL_END
