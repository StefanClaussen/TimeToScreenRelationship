//
//  ViewController.m
//  MovingViewOffLeftReturnFromRight
//
//  Created by Stefan Claussen on 02/10/2014.
//  Copyright (c) 2014 One foot after the other. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *movement;
    NSInteger cloudsMovement;
    UIView *clouds1;
    UIView *clouds2;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    movement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moving) userInfo:nil repeats:YES];
    
    clouds1 = [[UIView alloc] initWithFrame:CGRectMake(10.0, 20.0, 5.0, 10.0)];
    [clouds1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:clouds1];
    
    clouds2 = [[UIView alloc] initWithFrame:CGRectMake(40.0, 100.0, 5.0, 10.0)];
    [clouds2 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:clouds2];

    cloudsMovement = 2;
}

-(void)platformMovement{
    clouds1.center = CGPointMake(clouds1.center.x + cloudsMovement, clouds1.center.y);
    
    clouds2.center = CGPointMake(clouds2.center.x + cloudsMovement, clouds1.center.y);
    
}

-(void)moving{
    
    if (clouds1.center.x > 470){
        clouds1.center = CGPointMake(-150, clouds1.center.y);
    }
    
    if (clouds2.center.x > 470){
        clouds2.center = CGPointMake(-150, clouds2.center.y);
    }
    
    [self platformMovement];
    
}

@end
