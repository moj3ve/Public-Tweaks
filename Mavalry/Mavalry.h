#import <UIKit/UIKit.h>
#import <UIKit/UIControl.h>
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist"

// Haptic generator
UIImpactFeedbackGenerator *hapt;

extern NSString *const kCAFilterDestOut;

@interface SBRootFolderView : UIView
- (UIViewController *)todayViewController;
@end

@interface CCUIBaseSliderView : UIView
@property(nonatomic, retain) UILabel *percentLabel;
- (float)value;
@end

@interface CALayer (Private)
@property(nonatomic, retain) NSString *compositingFilter;
@property(nonatomic, assign) BOOL allowsGroupOpacity;
@property(nonatomic, assign) BOOL allowsGroupBlending;
@end

@interface NCNotificationListSectionRevealHintView : UIView
@property(nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

// general boolean
BOOL isEnabled;

// booleans
BOOL wantsCCLabels, wantsHomeBar, wantsOlderNotifs, wantsTransparentDock, wantsHiddenPageDots, wantsHiddenLabels, hideFolderBackground, moonGone, noTodayLS, noTodayHS, noSpotlight, wantsHapticVol, wantsHapticScreenshot;

// values with comma
float hapticPref, volumePref, screenshotPref;

// values
int CCLabelsSize;

static void loadPrefs() {

    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : YES;
    wantsCCLabels = [prefs objectForKey:@"wantsCCLabels"] ? [[prefs objectForKey:@"wantsCCLabels"] boolValue] : YES;
    wantsHomeBar = [prefs objectForKey:@"wantsHomeBar"] ? [[prefs objectForKey:@"wantsHomeBar"] boolValue] : YES;
    wantsOlderNotifs = [prefs objectForKey:@"wantsOlderNotifs"] ? [[prefs objectForKey:@"wantsOlderNotifs"] boolValue] : YES;
    wantsTransparentDock = [prefs objectForKey:@"wantsTransparentDock"] ? [[prefs objectForKey:@"wantsTransparentDock"] boolValue] : YES;
    wantsHiddenPageDots = [prefs objectForKey:@"wantsHiddenPageDots"] ? [[prefs objectForKey:@"wantsHiddenPageDots"] boolValue] : YES;
    wantsHiddenLabels = [prefs objectForKey:@"wantsHiddenLabels"] ? [[prefs objectForKey:@"wantsHiddenLabels"] boolValue] : YES;
    hideFolderBackground = [prefs objectForKey:@"hideFolderBackground"] ? [[prefs objectForKey:@"hideFolderBackground"] boolValue] : YES;
    moonGone = [prefs objectForKey:@"moonGone"] ? [[prefs objectForKey:@"moonGone"] boolValue] : YES;
    noTodayLS = [prefs objectForKey:@"noTodayLS"] ? [[prefs objectForKey:@"noTodayLS"] boolValue] : YES;
    noTodayHS = [prefs objectForKey:@"noTodayHS"] ? [[prefs objectForKey:@"noTodayHS"] boolValue] : YES;
    wantsHapticVol = [prefs objectForKey:@"wantsHapticVol"] ? [[prefs objectForKey:@"wantsHapticVol"] boolValue] : YES;
    wantsHapticScreenshot = [prefs objectForKey:@"wantsHapticScreenshot"] ? [[prefs objectForKey:@"wantsHapticScreenshot"] boolValue] : YES;
    noSpotlight = [prefs objectForKey:@"noSpotlight"] ? [[prefs objectForKey:@"noSpotlight"] boolValue] : YES;
    hapticPref = [[prefs objectForKey:@"hapticPref"] floatValue];
    screenshotPref = [[prefs objectForKey:@"screenshotPref"] floatValue];
    volumePref = [[prefs objectForKey:@"volumePref"] floatValue];
    CCLabelsSize = [[prefs objectForKey:@"CCLabelsSize"] intValue];
}