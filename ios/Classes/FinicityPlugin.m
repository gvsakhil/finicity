#import "FinicityPlugin.h"
#if __has_include(<finicity/finicity-Swift.h>)
#import <finicity/finicity-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "finicity-Swift.h"
#endif

@implementation FinicityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFinicityPlugin registerWithRegistrar:registrar];
}
@end
