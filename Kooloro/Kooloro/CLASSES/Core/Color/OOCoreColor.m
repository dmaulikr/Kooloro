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
    return [UIColor redColor];
}

+(UIColor*)yellowTile
{
   return [UIColor yellowColor];
}

+(UIColor*)greenTile
{
    return [UIColor greenColor];
}

+(UIColor*)blueTile
{
    return [UIColor blueColor];
}

+(UIColor*)pinkTile
{
    return [UIColor magentaColor];
}

+(UIColor*)purpleTile
{
    return [UIColor purpleColor];
}


@end
