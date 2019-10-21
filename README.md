# vastram

What to wear!

## iOS Firebase Configuration

Do the following in xcode

1. Import google plist file into runner folder.
2. Add following to info.plist file
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>com.googleusercontent.apps.749566680990-7nnj4je3lc0m3l52dtfoa9j6n7j2g96l</string>
            </array>
        </dict>
    </array>

3. Update AppDelegate.m file to following
    #include "AppDelegate.h"
    #include "GeneratedPluginRegistrant.h"

    @import Firebase;
    @implementation AppDelegate

    - (BOOL)application:(UIApplication *)application
        didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        [FIRApp configure];
        [GeneratedPluginRegistrant registerWithRegistry:self];
        // Override point for customization after application launch.
        return [super application:application didFinishLaunchingWithOptions:launchOptions];
    }

    @end
