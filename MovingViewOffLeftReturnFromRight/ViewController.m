//
//  ViewController.m
//  MovingViewOffLeftReturnFromRight

//  Spacing between views is not always equal.
//  Have added space when off the screen.
//  Need to figure out the maths.

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *movement;
    NSInteger viewsMovement;
    UIView *view1;
    UIView *view2;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    movement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moving) userInfo:nil repeats:YES];
    
    //In CGRectMake
    //first number is x starting points, can use this to set the distance between the views
    //second number is y location, so how high or low on the screen.
    //Last two values are the rectangles size.
    view1 = [[UIView alloc] initWithFrame:CGRectMake(315.0, 100.0, 5.0, 10.0)];
    [view1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view1];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(100.0, 100.0, 5.0, 10.0)];
    [view2 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:view2];

    //Use this variable to set the speed.  If O, does not move.
    viewsMovement = 2;
}

-(void)platformMovement{
    view1.center = CGPointMake(view1.center.x - viewsMovement, view1.center.y);
    
    view2.center = CGPointMake(view2.center.x - viewsMovement, view1.center.y);
    
}

-(void)moving{
    
    if (view1.center.x < -200){
        view1.center = CGPointMake(+320, view1.center.y);
    }
    
    if (view2.center.x < -200){
        view2.center = CGPointMake(+320, view2.center.y);
    }
    
    [self platformMovement];
}

@end
