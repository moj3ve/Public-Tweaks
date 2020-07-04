//
//
// HV,
// tweak made by samoht.
// 
//

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.samoht.hvprefs.plist"

// taptic generator
UIImpactFeedbackGenerator *hapt;

//prefs
float hapticPref;
float volumePref;
BOOL enabled;
static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    hapticPref = [[prefs objectForKey:@"hapticPref"] floatValue];
    volumePref = [[prefs objectForKey:@"volumePref"] floatValue];
	enabled = [prefs objectForKey:@"enabled"] ? [[prefs objectForKey:@"enabled"] boolValue] : YES;
}

%hook SBVolumeHardwareButton 

- (void)​volumeIncreasePress:(id) {
	
	if (enabled) {

		UIImpactFeedbackGenerator *hapt = [[UIImpactFeedbackGenerator alloc] init];
		[hapt prepare];

		if (hapticPref == 1) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight]; //Light feedback

		} else if (hapticPref == 2) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium]; //Medium feedback

		} else if (hapticPref == 3) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy]; //Heavy feedback

		} else if (hapticPref == 4) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft]; //Soft feedback

		} else if (hapticPref == 5) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid]; //Rigid feedback

		}
			
		[hapt impactOccurred];

}

- (void)​volumeDecreasePress:(id) {
	
	if (enabled) {

		UIImpactFeedbackGenerator *hapt = [[UIImpactFeedbackGenerator alloc] init];
		[hapt prepare];

		if (hapticPref == 1) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight]; //Light feedback

		} else if (hapticPref == 2) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium]; //Medium feedback

		} else if (hapticPref == 3) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy]; //Heavy feedback

		} else if (hapticPref == 4) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft]; //Soft feedback

		} else if (hapticPref == 5) {
			hapt = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid]; //Rigid feedback

		}
			
		[hapt impactOccurred];
}

%end

%hook SBVolumeControl

- (float)volumeStepUp {

	if (enabled && volumePref != 0.0) {
		return (volumePref); //possible values from 0.01 -> 1.0

	} else {
		return %orig; // orig returns 0.6
	}
	
}

- (float)volumeStepDown {

	if (enabled && volumePref != 0.0) {
		return (volumePref); //possible values from 0.01 -> 1.0

	} else {
		return %orig; // orig returns 0.6
	}
	
}

%end

%ctor {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.samoht.hvprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}