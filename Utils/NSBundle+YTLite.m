#import "NSBundle+YTLite.h"

@implementation NSBundle (YTLite)

+ (NSBundle *)ytl_defaultBundle {
    static NSBundle *bundle = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        NSString *tweakBundlePath = [[NSBundle mainBundle] pathForResource:@"YTLite" ofType:@"bundle"];
        #if defined(ROOTHIDE) && __has_include(<roothide.h>)
            #import <roothide.h>
            NSString *bundlePath = jbroot(@"/Library/Application Support/YTLite.bundle");
        #else
            NSString *bundlePath = ROOT_PATH_NS("/Library/Application Support/YTLite.bundle");
        #endif

        bundle = [NSBundle bundleWithPath:tweakBundlePath ?: bundlePath];
    });

    return bundle;
}

@end
