//
//  ViewController.m
//  MovingViewOffLeftReturnFromRight

//  Spacing between views is not always equal.
//  Have added space when off the screen.
//  Need to figure out the maths.

#import "ViewController.h"
#import "HourIndicator.h"

@interface ViewController ()
{
    NSTimer *movement;
    NSInteger viewsMovement;
}

@property (strong, nonatomic)HourIndicator *hour1;
@property (strong, nonatomic)HourIndicator *hour2;


@end

@implementation ViewController

//  Goal refactor so two views that show at different times.

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    movement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moving) userInfo:nil repeats:YES];
    
    //In CGRectMake
    //first number is x starting points, can use this to set the distance between the views
    //second number is y location, so how high or low on the screen.
    //Last two values are the rectangles size.
    self.hour1 = [[HourIndicator alloc] initWithFrame:CGRectMake(315.0f, 92.0f, 2.0f, 10.0f)];
    [self.hour1 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.hour1];
    
    self.hour2 = [[HourIndicator alloc] initWithFrame:CGRectMake(75.0f, 92.0f, 2.0f, 10.0f)];
    [self.hour2 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.hour2];

    //Use this variable to set the speed.  If O, does not move.
    viewsMovement = 2;
}

-(void)platformMovement{
    self.hour1.center = CGPointMake(self.hour1.center.x - viewsMovement, self.hour1.center.y);
    
    self.hour2.center = CGPointMake(self.hour2.center.x - viewsMovement, self.hour1.center.y);
    
}

-(void)moving{
    
    if (self.hour1.center.x < -200){
        self.hour1.center = CGPointMake(+320, self.hour1.center.y);
    }
    
    if (self.hour2.center.x < -200){
        self.hour2.center = CGPointMake(+320, self.hour2.center.y);
    }
    
    [self platformMovement];
}

@end
