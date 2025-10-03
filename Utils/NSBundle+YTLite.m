#import "NSBundle+YTLite.h"

@implementation NSBundle (YTLite)

+ (NSBundle *)ytl_defaultBundle {
    static NSBundle *bundle = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        NSString *bundlePath = nil;

#if ROOTLESS
        bundlePath = ROOT_PATH_NS("/Library/Application Support/YTLite.bundle");
#elif ROOTHIDE
        bundlePath = jbroot(@"/Library/Application Support/YTLite.bundle");
#else
        bundlePath = [[NSBundle mainBundle] pathForResource:@"YTLite" ofType:@"bundle"];
#endif

        bundle = [NSBundle bundleWithPath:bundlePath];
    });

    return bundle;
}

@end
