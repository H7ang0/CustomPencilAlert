#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface AlertWindow : UIWindow
@end

@implementation AlertWindow

- (instancetype)init {
    self = [super init];
    if (self) {
        self.windowLevel = UIWindowLevelAlert;
        self.backgroundColor = [UIColor clearColor];
        self.hidden = NO;
    }
    return self;
}

@end

@interface CustomToastView : UIView

@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) AlertWindow *alertWindow;

+ (void)showToast:(NSString *)message;

@end

@implementation CustomToastView

+ (void)showToast:(NSString *)message {
    CustomToastView *toast = [[CustomToastView alloc] initWithMessage:message];
    [toast show];
}

- (instancetype)initWithMessage:(NSString *)message {
    CGFloat width = 200;
    CGFloat height = 50;
    CGRect frame = CGRectMake(0, 0, width, height);
    
    self = [super initWithFrame:frame];
    if (self) {
        // 设置居中位置
        self.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 100);
        
        // 设置完全圆角（高度的一半）
        self.layer.cornerRadius = height / 2;
        self.layer.masksToBounds = YES;
        
        // 半透明磨砂灰色效果
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterialDark];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
        effectView.frame = self.bounds;
        effectView.layer.cornerRadius = height / 2;
        effectView.layer.masksToBounds = YES;
        
        // 添加额外的灰色半透明背景
        UIView *overlayView = [[UIView alloc] initWithFrame:self.bounds];
        overlayView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
        overlayView.layer.cornerRadius = height / 2;
        [self addSubview:overlayView];
        
        [self addSubview:effectView];
        
        // 文本标签
        _messageLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _messageLabel.text = message;
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.font = [UIFont boldSystemFontOfSize:16];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        [effectView.contentView addSubview:_messageLabel];
        
        // 添加细微的边框
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.2].CGColor;
        
        // 创建独立窗口
        _alertWindow = [[AlertWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return self;
}

- (void)show {
    [self.alertWindow addSubview:self];
    [self.alertWindow makeKeyAndVisible];
    
    // 显示动画
    self.alpha = 0;
    self.transform = CGAffineTransformMakeScale(0.8, 0.8);
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformIdentity;
    }];
    
    // 3秒后消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismiss];
    });
}

- (void)dismiss {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.alertWindow.hidden = YES;
        self.alertWindow = nil;
    }];
}

@end

// 注入点
static void __attribute__((constructor)) initialize(void) {
    NSLog(@"Toast插件已加载");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [CustomToastView showToast:@"Test"];
    });
} 