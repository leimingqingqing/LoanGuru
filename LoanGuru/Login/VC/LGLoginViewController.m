//
//  LGLoginViewController.m
//  LoanGuru
//
//  Created by Apple on 2023/2/24.
//

#import "LGLoginViewController.h"
#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>
#import "AppDelegate.h"
#import "LGTokenSettingAndGetting.h"
#import "UIButton+Main.h"
#import "LGLoginViewModel.h"
#import "LGLoginModel.h"
@interface LGLoginViewController ()
@property(nonatomic, strong)TPKeyboardAvoidingScrollView *scrollView;
@property(nonatomic, strong)UIImageView *bgImageView;
@property(nonatomic, strong)UIView *bottomWhiteView;
@property(nonatomic, strong)UILabel *telPreLabel;
@property(nonatomic, strong)UITextField *telTextField;
@property(nonatomic, strong)UITextField *vertifyCodeTextField;
@property(nonatomic, strong)UIButton *getVertifyCodeButton;
@property(nonatomic, strong)UIButton *nextButton;
@property(nonatomic, strong)UIButton *squareSelectBtn;
@property(nonatomic, strong)UILabel *protocolBlueLabel;
@property(nonatomic, strong)UIButton *backBtn;
@property(nonatomic)BOOL ifAgreeProtocal;
@end

@implementation LGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _ifAgreeProtocal = NO;
    [self setUpView];
    
    @weakify(self)
    RAC(self.nextButton,enabled) = [RACSignal combineLatest:@[[self.telTextField rac_textSignal],[self.vertifyCodeTextField rac_textSignal],RACObserve(self, ifAgreeProtocal)] reduce:^id _Nullable{
        @strongify(self)
        BOOL ifCanNext = YES;
        if(self.telTextField.text.length < 9){
            ifCanNext = NO;
        }
        if(self.vertifyCodeTextField.text.length == 0){
            ifCanNext = NO;
        }
        if(self.ifAgreeProtocal == NO){
            ifCanNext = NO;
        }
        if(ifCanNext){
            [self.nextButton setBackgroundColor:mainColor];
            [self.nextButton yb_addShadowWithColor:mainColor];
            [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else{
            [self.nextButton setBackgroundColor:mainLightColor];
            [self.nextButton yb_addShadowWithColor:mainLightColor];
            [self.nextButton setTitleColor:[UIColor jk_colorWithHexString:@"333333"] forState:UIControlStateNormal];
        }
        return @(self.telTextField.text.length >= 9 && self.vertifyCodeTextField.text.length > 0 && self.ifAgreeProtocal == YES);
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)setUpView{
    self.scrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.scrollEnabled = NO;
    if(@available(iOS 11.0,*)){
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    
    self.bgImageView = [[UIImageView alloc] init];
    self.bgImageView.image = [UIImage imageNamed:@"login_background"];
    self.bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.scrollView addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_offset(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT);
    }];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.backBtn setImage:[UIImage imageNamed:@"login_back"] forState:UIControlStateNormal];
    [self.scrollView addSubview:self.backBtn];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.top.mas_offset(k_StatusBarHeight +10);
        make.width.height.mas_equalTo(26);
    }];
    
    self.bottomWhiteView = [[UIView alloc] init];
    self.bottomWhiteView.backgroundColor = [UIColor whiteColor];
    self.bottomWhiteView.layer.cornerRadius = 30.f;
    self.bottomWhiteView.clipsToBounds = YES;
    [self.scrollView addSubview:self.bottomWhiteView];
    [self.bottomWhiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.bottom.mas_equalTo(self.bgImageView.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(height(320)+20);
    }];
    
    UILabel *signInLabel = [[UILabel alloc] init];
    signInLabel.text = @"Sign in";
    signInLabel.textColor = [UIColor jk_colorWithHexString:@"333333"];
    signInLabel.font = [UIFont boldSystemFontOfSize:20.f];
    [self.bottomWhiteView addSubview:signInLabel];
    [signInLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(39);
        make.top.mas_offset(24);
    }];
    
    UIImageView *telIcon = [[UIImageView alloc] init];
    telIcon.image = [UIImage imageNamed:@"login_tel"];
    [self.bottomWhiteView addSubview:telIcon];
    [telIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(signInLabel);
        make.top.mas_equalTo(signInLabel.mas_bottom).mas_offset(22);
    }];
    
    self.telPreLabel = [[UILabel alloc] init];
    self.telPreLabel.textColor = [UIColor jk_colorWithHexString:@"333333"];
    self.telPreLabel.text = @"+91-";
    self.telPreLabel.font = [UIFont systemFontOfSize:14.f];
    [self.bottomWhiteView addSubview:self.telPreLabel];
    [self.telPreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(telIcon.mas_right).mas_offset(14);
        make.top.bottom.mas_equalTo(telIcon);
    }];
    
    NSString *telNum = [LGTokenSettingAndGetting getUserIphoneNum];
    self.telTextField = [[UITextField alloc] init];
    self.telTextField.textColor = [UIColor jk_colorWithHexString:@"333333"];
    self.telTextField.font = [UIFont systemFontOfSize:14.f];
    self.telTextField.text = telNum?telNum:@"";
    self.telTextField.keyboardType = UIKeyboardTypePhonePad;
    self.telTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.bottomWhiteView addSubview:self.telTextField];
    [self.telTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.telPreLabel.mas_right);
        make.top.bottom.mas_equalTo(self.telPreLabel);
        make.right.mas_offset(-35);
    }];
    
    UIView *telBottomLine = [[UIView alloc] init];
    telBottomLine.backgroundColor = [UIColor jk_colorWithHexString:@"E6F1F1"];
    [self.bottomWhiteView addSubview:telBottomLine];
    [telBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(67);
        make.right.mas_offset(-35);
        make.top.mas_equalTo(self.telTextField.mas_bottom).mas_offset(8);
        make.height.mas_equalTo(1);
    }];
    
    UIImageView *keyIcon = [[UIImageView alloc] init];
    keyIcon.image = [UIImage imageNamed:@"login_key"];
    [self.bottomWhiteView addSubview:keyIcon];
    [keyIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(telIcon);
        make.top.mas_equalTo(telIcon.mas_bottom).mas_offset(41);
    }];
    
    self.getVertifyCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.getVertifyCodeButton addTarget:self action:@selector(sendCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    self.getVertifyCodeButton.layer.cornerRadius = 6.f;
    self.getVertifyCodeButton.layer.borderWidth = 1.0;
    self.getVertifyCodeButton.layer.borderColor = [UIColor jk_colorWithHexString:@"888888"].CGColor;
    [self.getVertifyCodeButton setTitle:@"Get verification code" forState:UIControlStateNormal];
    [self.getVertifyCodeButton setTitleColor:[UIColor jk_colorWithHexString:@"444444"] forState:UIControlStateNormal];
    self.getVertifyCodeButton.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [self.bottomWhiteView addSubview:self.getVertifyCodeButton];
    [self.getVertifyCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-35);
        make.width.mas_equalTo(129);
        make.top.mas_equalTo(keyIcon);
        make.height.mas_equalTo(32);
    }];
    
    self.vertifyCodeTextField = [[UITextField alloc] init];
    self.vertifyCodeTextField.textColor = [UIColor jk_colorWithHexString:@"333333"];
    self.vertifyCodeTextField.placeholder = @"Verification Code";
    self.vertifyCodeTextField.font = [UIFont systemFontOfSize:14.f];
    self.vertifyCodeTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.bottomWhiteView addSubview:self.vertifyCodeTextField];
    [self.vertifyCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(keyIcon.mas_right).mas_offset(14);
        make.top.bottom.mas_equalTo(self.getVertifyCodeButton);
        make.right.mas_equalTo(self.getVertifyCodeButton.mas_left).mas_offset(-8);
    }];
    
    UIView *keyBottomLine = [[UIView alloc] init];
    keyBottomLine.backgroundColor = [UIColor jk_colorWithHexString:@"E6F1F1"];
    [self.bottomWhiteView addSubview:keyBottomLine];
    [keyBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(67);
        make.right.mas_offset(-35);
        make.top.mas_equalTo(self.getVertifyCodeButton.mas_bottom).mas_offset(8);
        make.height.mas_equalTo(1);
    }];
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextButton yb_addShadowWithColor:[UIColor jk_colorWithHexString:@"0C7472"]];
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nextButton setTitle:@"NEXT" forState:UIControlStateNormal];
    [self.nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    self.nextButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.f];
    self.nextButton.layer.cornerRadius = 25.f;
    [self.nextButton setBackgroundColor:[UIColor jk_colorWithHexString:@"0C7472"]];
    [self.bottomWhiteView addSubview:self.nextButton];
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(36);
        make.right.mas_offset(-36);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(keyBottomLine.mas_bottom).mas_offset(40);
    }];
    
    UILabel *protocalGaryLabel = [[UILabel alloc] init];
    protocalGaryLabel.textColor = [UIColor jk_colorWithHexString:@"888888"];
    protocalGaryLabel.text = @"I have read and agree with the";
    protocalGaryLabel.font = [UIFont systemFontOfSize:12.f];
    [self.bottomWhiteView addSubview:protocalGaryLabel];
    [protocalGaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bottomWhiteView).mas_offset(-50);
        make.top.mas_equalTo(self.nextButton.mas_bottom).mas_offset(38);
    }];
    
    self.protocolBlueLabel = [[UILabel alloc] init];
    self.protocolBlueLabel.userInteractionEnabled = YES;
    self.protocolBlueLabel.text = @"Privacy Agreement";
    self.protocolBlueLabel.textColor = [UIColor jk_colorWithHexString:@"1EB2F6"];
    self.protocolBlueLabel.font = [UIFont systemFontOfSize:12.f];
    self.protocolBlueLabel.textAlignment = NSTextAlignmentCenter;
    [self.bottomWhiteView addSubview:self.protocolBlueLabel];
    [self.protocolBlueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(protocalGaryLabel.mas_right).mas_offset(4);
        make.centerY.mas_equalTo(protocalGaryLabel);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checkPrivacyAgreement)];
    [self.protocolBlueLabel addGestureRecognizer:tap];

    self.squareSelectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.squareSelectBtn setImage:[UIImage imageNamed:@"login_square_unselect"] forState:UIControlStateNormal];
    [self.bottomWhiteView addSubview:self.squareSelectBtn];
    [self.squareSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(protocalGaryLabel.mas_left).mas_offset(-4);
        make.centerY.mas_equalTo(protocalGaryLabel);
        make.width.height.mas_equalTo(12);
    }];
    @weakify(self)
    [[self.squareSelectBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        if(self.ifAgreeProtocal == NO){
            [self.squareSelectBtn setImage:[UIImage imageNamed:@"login_square_selected"] forState:UIControlStateNormal];
        }else{
            [self.squareSelectBtn setImage:[UIImage imageNamed:@"login_square_unselect"] forState:UIControlStateNormal];
        }
        self.ifAgreeProtocal = !self.ifAgreeProtocal;
    }];
}

-(void)nextAction:(UIButton *)sender{
    [LGLoginViewModel loginWithActed:self.telTextField.text spectacle:self.vertifyCodeTextField.text interesting:@"interesting" ashamed:@"ashamed" Success:^(LGApiModel * _Nullable dataModel) {
        LGLoginModel *loginModel = [LGLoginModel mj_objectWithKeyValues:dataModel.data];
        [LGTokenSettingAndGetting setCurrentSessionId:loginModel.homestead];
    } fail:^(LGApiModel * _Nullable dataModel, NSInteger errorCode) {
        
    }];
    
    [LGTokenSettingAndGetting setUserIphoneNum:self.telTextField.text];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate goToHomePage];
    
}

-(void)backAction:(UIButton *)btn{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate goToHomePage];
}

-(void)checkPrivacyAgreement{
    [LGRoutes routeURL:[NSURL URLWithString:@"cashmart://app.cashmart.in/login"]];
}

-(void)sendCodeAction:(UIButton *)btn{
    [LGLoginViewModel getVertifyCodeWithDeceived:self.telTextField.text treacherously:@"treacherously" Success:^(LGApiModel * _Nullable dataModel) {
        [LGProgressHUD showSuccessMessage:dataModel.msg];
        [self.getVertifyCodeButton jk_startTime:59 title:@"Verification Code" waitTittle:@" seconds"];

    } fail:^(LGApiModel * _Nullable dataModel, NSInteger errorCode) {
        
    }];

}
@end
