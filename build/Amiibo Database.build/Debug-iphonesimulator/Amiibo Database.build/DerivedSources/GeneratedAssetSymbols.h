#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "Mario" asset catalog image resource.
static NSString * const ACImageNameMario AC_SWIFT_PRIVATE = @"Mario";

/// The "au" asset catalog image resource.
static NSString * const ACImageNameAu AC_SWIFT_PRIVATE = @"au";

/// The "eu" asset catalog image resource.
static NSString * const ACImageNameEu AC_SWIFT_PRIVATE = @"eu";

/// The "jp" asset catalog image resource.
static NSString * const ACImageNameJp AC_SWIFT_PRIVATE = @"jp";

/// The "na" asset catalog image resource.
static NSString * const ACImageNameNa AC_SWIFT_PRIVATE = @"na";

#undef AC_SWIFT_PRIVATE
