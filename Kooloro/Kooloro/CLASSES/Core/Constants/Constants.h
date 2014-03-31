//
//  Constants.h
//  Kooloro
//
//  Created by hugo mazet on 06/11/2013.
//  Copyright (c) 2013 hugo mazet. All rights reserved.
//

#ifndef Kooloro_Constants_h
#define Kooloro_Constants_h


#define OOApplicationPreferences            [NSUserDefaults standardUserDefaults]
#define OOApplicationBundleIdentifier       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
#define OOApplicationVersionNumber          [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"]
#define OOApplicationBuildNumber            [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey]

#define IS_4inch_screen ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define IS_SIMULATOR   ( [[[UIDevice currentDevice] model] isEqualToString: @"iPhone Simulator"] )
#define IS_IPHONE ( [[[UIDevice currentDevice] model] isEqualToString: @"iPhone"] || IS_SIMULATOR )
#define IS_IPOD   ( [[[UIDevice currentDevice] model] isEqualToString: @"iPod touch"] )

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif


#define OOMagicalNumber                     10
#define OOCornerRadius                      5



#endif
