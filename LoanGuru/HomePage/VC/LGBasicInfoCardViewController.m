//
//  LGBasicInfoCardViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/2/27.
//

#import "LGBasicInfoCardViewController.h"
#import "LGAuthAlertView.h"
#import "LGConfirmCardInfoAlertView.h"
@interface LGBasicInfoCardViewController ()
@property (nonatomic, strong)UIScrollView *scrollview;
@property (nonatomic, strong)UIButton *backBtn;
@property (nonatomic, strong)UILabel *topTipLabel;
@property (nonatomic, strong)UIView *aadhaarPhotosView;
@property (nonatomic, strong)UIView *panCardView;
@property (nonatomic, strong)UIButton *applyBtn;
@property (nonatomic, strong)UIView *aadhaarFrontView;
@property (nonatomic, strong)UIImageView *aadhaarFrontImageView;
@property (nonatomic, strong)UIView *aadhaarBackView;
@property (nonatomic, strong)UIImageView *aadhaarBackImageView;
@property (nonatomic, strong)UIView *pandCardPhotoView;
@property (nonatomic, strong)UIImageView *pandCardPhotoImageView;
@end

@implementation LGBasicInfoCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor jk_colorWithHexString:@"F1F5F9"];
    [self setUpView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)setUpView{
    UILabel *topTitleLabel = [[UILabel alloc] init];
    topTitleLabel.text = @"Basic Information";
    topTitleLabel.textColor = [UIColor jk_colorWithHexString:@"333333"];
    topTitleLabel.font = [UIFont boldSystemFontOfSize:18.f];
    [self.view addSubview:topTitleLabel];
    [topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(k_StatusBarHeight+7);
        make.centerX.mas_equalTo(self.view);
    }];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.backBtn setImage:[UIImage imageNamed:@"home_auth_blackArrow"] forState:UIControlStateNormal];
    [self.view addSubview:self.backBtn];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_equalTo(topTitleLabel);
        make.width.height.mas_equalTo(26);
    }];
    
    self.applyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.applyBtn addTarget:self action:@selector(applyAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.applyBtn setTitle:@"Apply  Now" forState:UIControlStateNormal];
    [self.applyBtn setBackgroundColor:mainColor];
    self.applyBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.applyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.applyBtn.layer.cornerRadius = 25.f;
    [self.view addSubview:self.applyBtn];
    [self.applyBtn yb_addShadowWithColor:mainColor];
    [self.applyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(35);
        make.right.mas_offset(-35);
        make.height.mas_equalTo(50);
        make.bottom.mas_offset(-45);
    }];
    
    self.scrollview = [[UIScrollView alloc] init];
    self.scrollview.backgroundColor = [UIColor clearColor];
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.showsHorizontalScrollIndicator = NO;
    if(@available(iOS 11.0,*)){
        self.scrollview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:self.scrollview];
    [self.scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topTitleLabel.mas_bottom).mas_offset(16);
        make.left.right.mas_offset(0);
        make.bottom.mas_offset(-110);
    }];
    
    UIView *scrollContentView = [[UIView alloc] init];
    scrollContentView.backgroundColor = [UIColor clearColor];
    [self.scrollview addSubview:scrollContentView];
    [scrollContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_offset(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
    self.topTipLabel = [[UILabel alloc] init];
    self.topTipLabel.text = @"Please confirm uploading your photo information and we ensure will not be leaked to the third parties.";
    self.topTipLabel.numberOfLines = 0;
    self.topTipLabel.textAlignment = NSTextAlignmentCenter;
    self.topTipLabel.textColor = [UIColor jk_colorWithHexString:@"444444"];
    self.topTipLabel.font = [UIFont boldSystemFontOfSize:14.f];
    [scrollContentView addSubview:self.topTipLabel];
    [self.topTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(60);
        make.right.mas_offset(-60);
        make.top.mas_equalTo(topTitleLabel.mas_bottom).mas_offset(35);
    }];
    
    self.aadhaarPhotosView = [[UIView alloc] init];
    self.aadhaarPhotosView.backgroundColor = [UIColor whiteColor];
    self.aadhaarPhotosView.layer.cornerRadius = 16;
    self.aadhaarPhotosView.clipsToBounds = YES;
    [scrollContentView addSubview:self.aadhaarPhotosView];
    [self.aadhaarPhotosView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.mas_equalTo(self.topTipLabel.mas_bottom).mas_offset(28);
        make.height.mas_equalTo(184);
    }];
    
    self.aadhaarFrontView = [[UIView alloc] init];
    self.aadhaarFrontView.userInteractionEnabled = YES;
    self.aadhaarFrontView.backgroundColor = [UIColor clearColor];
    [self.aadhaarPhotosView addSubview:self.aadhaarFrontView];
    [self.aadhaarFrontView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(14);
        make.top.mas_offset(27);
        make.width.mas_equalTo((SCREEN_WIDTH - 30 - 38)/2);
        make.height.mas_equalTo(92);
    }];
    
    UITapGestureRecognizer *tap01 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addFrontPhotoAction:)];
    [self.aadhaarFrontView addGestureRecognizer:tap01];
    
    self.aadhaarFrontImageView = [[UIImageView alloc] init];
    self.aadhaarFrontImageView.image = [UIImage imageNamed:@"home_auth_aadhaarFront"];
    [self.aadhaarFrontView addSubview:self.aadhaarFrontImageView];
    [self.aadhaarFrontImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_offset(0);
    }];
    
    UIImageView *frontPhotoIcon = [[UIImageView alloc] init];
    frontPhotoIcon.image = [UIImage imageNamed:@"home_auth_photo"];
    [self.aadhaarFrontView addSubview:frontPhotoIcon];
    [frontPhotoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.aadhaarFrontView);
        make.top.mas_offset(24);
    }];
    
    UILabel *frontPhotoTitleLabel = [[UILabel alloc] init];
    frontPhotoTitleLabel.text = @"Aadhaar Front";
    frontPhotoTitleLabel.font = [UIFont boldSystemFontOfSize:12.f];
    frontPhotoTitleLabel.textColor = mainColor;
    [self.aadhaarFrontView addSubview:frontPhotoTitleLabel];
    [frontPhotoTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(frontPhotoIcon);
        make.top.mas_equalTo(frontPhotoIcon.mas_bottom).mas_offset(5);
    }];
    
    self.aadhaarBackView = [[UIView alloc] init];
    self.aadhaarBackView.userInteractionEnabled = YES;
    self.aadhaarBackView.backgroundColor = [UIColor clearColor];
    [self.aadhaarPhotosView addSubview:self.aadhaarBackView];
    [self.aadhaarBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-14);
        make.top.mas_offset(27);
        make.width.mas_equalTo((SCREEN_WIDTH - 30 - 38)/2);
        make.height.mas_equalTo(92);
    }];
    
    UITapGestureRecognizer *tap02 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addBackPhotoAction:)];
    [self.aadhaarBackView addGestureRecognizer:tap02];
    
    self.aadhaarBackImageView = [[UIImageView alloc] init];
    self.aadhaarBackImageView.image = [UIImage imageNamed:@"home_auth_aadhaarBack"];
    [self.aadhaarBackView addSubview:self.aadhaarBackImageView];
    [self.aadhaarBackImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_offset(0);
    }];
    
    UIImageView *backPhotoIcon = [[UIImageView alloc] init];
    backPhotoIcon.image = [UIImage imageNamed:@"home_auth_photo"];
    [self.aadhaarBackView addSubview:backPhotoIcon];
    [backPhotoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.aadhaarBackView);
        make.top.mas_offset(24);
    }];
    
    UILabel *backPhotoTitleLabel = [[UILabel alloc] init];
    backPhotoTitleLabel.text = @"Aadhaar Back";
    backPhotoTitleLabel.font = [UIFont boldSystemFontOfSize:12.f];
    backPhotoTitleLabel.textColor = mainColor;
    [self.aadhaarBackView addSubview:backPhotoTitleLabel];
    [backPhotoTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(backPhotoIcon);
        make.top.mas_equalTo(backPhotoIcon.mas_bottom).mas_offset(5);
    }];
    
    UILabel *aadhaarBottomTipLabel = [[UILabel alloc] init];
    aadhaarBottomTipLabel.text = @"Please upload the front and back photos of your ID card.";
    aadhaarBottomTipLabel.textColor = [UIColor jk_colorWithHexString:@"444444"];
    aadhaarBottomTipLabel.font = [UIFont systemFontOfSize:12.f];
    aadhaarBottomTipLabel.numberOfLines = 0;
    [self.aadhaarPhotosView addSubview:aadhaarBottomTipLabel];
    [aadhaarBottomTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.bottom.mas_offset(-25);
    }];
    
    self.panCardView = [[UIView alloc] init];
    self.panCardView.backgroundColor = [UIColor whiteColor];
    self.panCardView.layer.cornerRadius = 16;
    self.panCardView.clipsToBounds = YES;
    [scrollContentView addSubview:self.panCardView];
    [self.panCardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.mas_equalTo(self.aadhaarPhotosView.mas_bottom).mas_offset(18);
        make.height.mas_equalTo(146);
        make.bottom.mas_offset(-20);
    }];
    
    self.pandCardPhotoView = [[UIView alloc] init];
    self.pandCardPhotoView.userInteractionEnabled = YES;
    self.pandCardPhotoView.backgroundColor = [UIColor clearColor];
    [self.panCardView addSubview:self.pandCardPhotoView];
    [self.pandCardPhotoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.centerY.mas_equalTo(self.panCardView);
        make.width.mas_equalTo(152);
        make.height.mas_equalTo(90);
    }];
    
    UITapGestureRecognizer *tap03 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addPanPhotoAction:)];
    [self.pandCardPhotoView addGestureRecognizer:tap03];
    
    self.pandCardPhotoImageView = [[UIImageView alloc] init];
    self.pandCardPhotoImageView.image = [UIImage imageNamed:@"home_auth_panCard"];
    [self.pandCardPhotoView addSubview:self.pandCardPhotoImageView];
    [self.pandCardPhotoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_offset(0);
    }];
    
    UIImageView *panCardPhotoIcon = [[UIImageView alloc] init];
    panCardPhotoIcon.image = [UIImage imageNamed:@"home_auth_photo"];
    [self.pandCardPhotoView addSubview:panCardPhotoIcon];
    [panCardPhotoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.pandCardPhotoView);
        make.top.mas_offset(24);
    }];
    
    UILabel *panCardPhotoTitleLabel = [[UILabel alloc] init];
    panCardPhotoTitleLabel.text = @"Pan Card";
    panCardPhotoTitleLabel.font = [UIFont boldSystemFontOfSize:12.f];
    panCardPhotoTitleLabel.textColor = mainColor;
    [self.pandCardPhotoView addSubview:panCardPhotoTitleLabel];
    [panCardPhotoTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(panCardPhotoIcon);
        make.top.mas_equalTo(panCardPhotoIcon.mas_bottom).mas_offset(5);
    }];
    
    UILabel *panCardRightTipLabel = [[UILabel alloc] init];
    panCardRightTipLabel.text = @"Please upload the front photo of Pan.";
    panCardRightTipLabel.textColor = [UIColor jk_colorWithHexString:@"444444"];
    panCardRightTipLabel.font = [UIFont systemFontOfSize:12.f];
    panCardRightTipLabel.numberOfLines = 0;
    [self.panCardView addSubview:panCardRightTipLabel];
    [panCardRightTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.pandCardPhotoView.mas_right).mas_offset(22);
        make.right.mas_offset(-26);
        make.centerY.mas_equalTo(self.pandCardPhotoView);
    }];
}

-(void)backAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)applyAction:(UIButton *)sender{
    
}

-(void)addFrontPhotoAction:(UIGestureRecognizer *)ges{
    LGAuthAlertView *frontAlertView = [[LGAuthAlertView alloc] initWithFrame:self.view.bounds style:LGFrontAlertStyle];
    [self.view addSubview:frontAlertView];
    frontAlertView.okBlock = ^{
        [self toTakePhotoWithStyle:LGConfirmFrontAlertStyle];
    };
}

-(void)addBackPhotoAction:(UIGestureRecognizer *)ges{
    LGAuthAlertView *backAlertView = [[LGAuthAlertView alloc] initWithFrame:self.view.bounds style:LGBackAlertStyle];
    [self.view addSubview:backAlertView];
    backAlertView.okBlock = ^{
        [self toTakePhotoWithStyle:LGConfirmBackAlertStyle];
    };
}

-(void)addPanPhotoAction:(UIGestureRecognizer *)ges{
    LGAuthAlertView *panAlertView = [[LGAuthAlertView alloc] initWithFrame:self.view.bounds style:LGPanAlertStyle];
    [self.view addSubview:panAlertView];
    panAlertView.okBlock = ^{
        [self toTakePhotoWithStyle:LGConfirmPanAlertStyle];
    };
}

-(void)toTakePhotoWithStyle:(LGAuthConfirmCardInfoAlertStyle)style{
    if(style == LGBackAlertStyle)return;
    LGConfirmCardInfoAlertView *confirmInfoAlertView = [[LGConfirmCardInfoAlertView alloc] initWithFrame:self.view.bounds style:style];
    [self.view addSubview:confirmInfoAlertView];
}
@end
