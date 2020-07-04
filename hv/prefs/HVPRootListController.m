#include "HVPRootListController.h"
#import <Preferences/PSSpecifier.h>

@implementation HVPRootListController

- (id)readPreferenceValue:(PSSpecifier*)specifier {
    NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    [settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
    return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
    NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    [settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
    [settings setObject:value forKey:specifier.properties[@"key"]];
    [settings writeToFile:path atomically:YES];
    CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
    if (notificationName) {
        CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
    }
}

- (void)sourceLink {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/totobighouse/tweaks"] options:@{} completionHandler:nil];
}

/* this tweak doesnt need to save but ill keep it for future projects.
-(void)save{
    [self.view endEditing:YES];
}
*/

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end

// Welcome View
@interface OBButtonTray : UIView
- (void)addButton:(id)arg1;
- (void)addCaptionText:(id)arg1;;
@end

@interface OBBoldTrayButton : UIButton
- (void)setTitle:(id)arg1 forState:(unsigned long long)arg2;
+ (id)buttonWithType:(long long)arg1;
@end

@interface OBWelcomeController : UIViewController
- (OBButtonTray *)buttonTray;
- (id)initWithTitle:(id)arg1 detailText:(id)arg2 icon:(id)arg3;
- (void)addBulletedListItemWithTitle:(id)arg1 description:(id)arg2 image:(id)arg3;
@end

/*
OBWelcomeController *welcomeController; // Declaring this here outside of a method will allow the use of it later, such as dismissing.

- (void)setupWelcomeController {

    // Create the OBWelcomeView with a title, a desription text, and an icon if you wish. Any of this can be nil if it doesn't apply to your view.
    welcomeController = [[OBWelcomeController alloc] initWithTitle:@"HV" detailText:@"Thanks for installing my tweak <3" icon:[UIImage systemImageNamed:@"gear"]];

    [welcomeController addBulletedListItemWithTitle:@"Point One" description:@"Add haptics to your volume buttons with 5 different intensities." image:[UIImage systemImageNamed:@"1.circle.fill"]];
    [welcomeController addBulletedListItemWithTitle:@"Point Two" description:@"Modify the volume steps to a desired ammount." image:[UIImage systemImageNamed:@"2.circle.fill"]];
    [welcomeController addBulletedListItemWithTitle:@"Point Three" description:@"Thats it for now lol." image:[UIImage systemImageNamed:@"3.circle.fill"]];

    // Create your button here, set some properties, and add it to the controller.
    OBBoldTrayButton* continueButton = [OBBoldTrayButton buttonWithType:1];
    [continueButton addTarget:self action:@selector(dismissController) forControlEvents:UIControlEventTouchUpInside];
    [continueButton setTitle:@"okay leave me alone" forState:UIControlStateNormal];
    [continueButton setClipsToBounds:YES]; 
    [continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; 
    [continueButton.layer setCornerRadius:15]; // Set your button's corner radius.
    [welcomeController.buttonTray addButton:continueButton];

    [welcomeController.buttonTray addCaptionText:@"tyty"];

    welcomeController.modalPresentationStyle = UIModalPresentationPageSheet; 
    welcomeController.modalInPresentation = YES; //Set this to yes if you don't want the user to dismiss this on a down swipe.
    welcomeController.view.tintColor = [UIColor systemGreenColor]; 
    [self presentViewController:welcomeController animated:YES completion:nil]; // Don't forget to present it!
}

- (void)dismissController { 
    [welcomeController dismissViewControllerAnimated:YES completion:nil];
}
*/