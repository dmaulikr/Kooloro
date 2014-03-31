//
//  OOCoreFont.m
//  Kooloro
//
//  Created by hugo mazet on 13/10/13.
//  Copyright (c) 2013 hugo mazet. All rights reserved.
//

#import "OOCoreFont.h"

//#define FONT_NAME @"HelveticaNeue"
//#define FONT_NAME @"HelveticaNeue-Light"
//#define FONT_NAME @"HelveticaNeue-UltraLight"

#define FONT_NAME_Bold @"Static Bold"
#define FONT_NAME @"Static"


@implementation OOCoreFont


// SMALL
+(UIFont*)GetFontSmall
{
    return [UIFont fontWithName:FONT_NAME size:14];
}
+(UIFont*)GetFontSmallBold
{
    return [UIFont fontWithName:FONT_NAME_Bold size:20];
}

// MEDIUM
+(UIFont*)GetFontMedium
{
    return [UIFont fontWithName:FONT_NAME size:25];
}
+(UIFont*)GetFontMediumBold
{
    return [UIFont fontWithName:FONT_NAME_Bold size:25];
}

// BIG
+(UIFont*)GetFontBig
{
    return [UIFont fontWithName:FONT_NAME size:45];
}
+(UIFont*)GetFontBigBold
{
    return [UIFont fontWithName:FONT_NAME_Bold size:50];
}


@end
