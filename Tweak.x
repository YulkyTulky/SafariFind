#import <UIKit/UIKit.h>
#import "SafariFind.h"

%hook BrowserRootViewController

- (void)viewDidAppear:(BOOL)arg1 {

	%orig;
	[self safariFind_addGestureRecognizer];

}

%new
- (void)safariFind_addGestureRecognizer {

	// Developer's Note:
	// Using "- (void)_sf_setTarget:(id)arg1 longPressAction:(SEL)arg2;" (for some odd reason) did not work until the button was already tapped once.

	for (UIBarButtonItem *item in [[self bottomToolbar] items]) {
		if ([[item description] containsString:@"symbol(system: square.and.arrow.up)"] ) { // 1.1 SafariFind compatibility (Yes, it is super lazy)
			[[item valueForKey:@"_view"] addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(safariFind_gestureRecognizerDidFire)]];
			break;
		}
	}
}

%new
- (void)safariFind_gestureRecognizerDidFire {

	[[self delegate] findKeyPressed];

}

%end