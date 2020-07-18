@interface BrowserController
- (void)findKeyPressed;
@end

@interface BrowserToolbar: UIToolbar
@end

@interface BrowserRootViewController: UIViewController
@property BrowserController *delegate;
@property BrowserToolbar *bottomToolbar;
- (void)safariFind_addGestureRecognizer;
- (void)safariFind_gestureRecognizerDidFire;
@end