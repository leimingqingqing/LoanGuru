//
//  LGInfoAuthTypeCell.h
//  LoanGuru
//
//  Created by Apple on 2023/2/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGInfoAuthTypeCell : UITableViewCell
@property (nonatomic, copy)void(^itemClickBlock)(NSInteger itemIndex);
@end

@interface LGInfoAuthItemOne : UIView
@property (nonatomic, strong)UIImageView *itemIcon;
@property (nonatomic, strong)UILabel *itemTopicLabel;
@property (nonatomic, strong)UIButton *arrowBtn;
@end

@interface LGInfoAuthItemTwo : UIView
@property (nonatomic, strong)UIImageView *itemIcon;
@property (nonatomic, strong)UILabel *itemTopicLabel;
@property (nonatomic, strong)UIButton *arrowBtn;
@end

NS_ASSUME_NONNULL_END
