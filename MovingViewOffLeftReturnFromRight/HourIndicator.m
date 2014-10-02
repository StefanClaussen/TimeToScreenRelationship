//
//  HourIndicator.m
//  MovingViewOffLeftReturnFromRight
//
//  Created by Stefan Claussen on 02/10/2014.
//  Copyright (c) 2014 One foot after the other. All rights reserved.
//

#import "HourIndicator.h"

@implementation HourIndicator

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGPoint startOfHorizontalLine = (CGPointMake(1.0f, 0.0f));
    CGPoint endOfHorizontalLine = (CGPointMake(1.0f, 10.0f));
    
    [[UIColor colorWithRed:40.0f/255.0f green:34.0f/255.0f blue:34.0f/255.0f alpha:1.0f] setStroke];
    
    UIBezierPath *horizontalLine = [UIBezierPath bezierPath];
    [horizontalLine moveToPoint:startOfHorizontalLine];
    [horizontalLine addLineToPoint:endOfHorizontalLine];
    [horizontalLine stroke];
}


@end
