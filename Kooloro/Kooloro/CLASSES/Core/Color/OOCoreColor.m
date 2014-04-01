//
//  OOCoreColor.m
//  Kooloro
//
//  Created by hugo mazet on 26/07/13.
//  Copyright (c) 2013 hugo mazet. All rights reserved.
//

#import "OOCoreColor.h"

@implementation OOCoreColor

//****************************
// TEXT
//****************************

+(UIColor*)blackText
{
    return [UIColor colorWithRed:92.0f/255.0f green:91.0f/255.0f blue:85.0f/255.0f alpha:1.0f];     // (5C5B55)
}

+(UIColor*)lightBlackText
{
    return [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.0];
}

+(UIColor*)redText
{
    return [UIColor colorWithRed:255.0/255.0 green:126.0/255.0 blue:121.0/255.0 alpha:1.0]; // (FF7E79)
}

+(UIColor*)grayText
{
    return [UIColor colorWithWhite: 0.80 alpha:1];
}

+(UIColor*)whiteText
{
    return [UIColor whiteColor];
}


//****************************
// BACKGROUND
//****************************

+(UIColor*)whiteBack
{
    return [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1.0];
}

+(UIColor*)redBack
{
    return [UIColor colorWithRed:255.0/255.0 green:126.0/255.0 blue:121.0/255.0 alpha:1.0];
}



//****************************
// COLOR TILE
//****************************

+(UIColor*)redTile
{
    return [self redBack];
}

+(UIColor*)greenTile
{
    return [UIColor colorWithRed:144.0/255.0 green:205.0/255.0 blue:156.0/255.0 alpha:1.0];
}

+(UIColor*)blueTile
{
    return [UIColor colorWithRed:105.0/255.0 green:210.0/255.0 blue:231.0/255.0 alpha:1.0];
}

+(UIColor*)yellowTile
{
   return [UIColor colorWithRed:255.0/255.0 green:225.0/255.0 blue:129.0/255.0 alpha:1.0];
}

+(UIColor*)purpleTile
{
    return [UIColor colorWithRed:227.0/255.0 green:170.0/255.0 blue:214.0/255.0 alpha:1.0];
}

+(UIColor*)pinkTile
{
    return [UIColor colorWithRed:255.0/255.0 green:189.0/255.0 blue:216.0/255.0 alpha:1.0];
}

+(UIColor*)orangeTile
{
    return [UIColor colorWithRed:255.0/255.0 green:196.0/255.0 blue:140.0/255.0 alpha:1.0];
}


@end
