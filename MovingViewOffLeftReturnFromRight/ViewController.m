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
    double viewsMovement;
}

@property (strong, nonatomic)HourIndicator *hour1;
@property (strong, nonatomic)HourIndicator *hour2;
@property (strong, nonatomic) IBOutlet UILabel *hourLabel1;
@property (strong, nonatomic) IBOutlet UILabel *hourLabel2;


@end

@implementation ViewController

//  Goal refactor so two views that show at different times.

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    movement = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moving) userInfo:nil repeats:YES];
    
    // strings are static.  The string should be created in HourIndicator class.
    self.hourLabel1.text = [NSString stringWithFormat:@"2pm"];
    self.hourLabel2.text = [NSString stringWithFormat:@"3pm"];
    
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
    viewsMovement = 0.5;
}

-(void)platformMovement
{
    self.hour1.center = CGPointMake(self.hour1.center.x - viewsMovement, self.hour1.center.y);
    NSLog(@"self.hour1.center.x - viewsMovement = %f", self.hour1.center.x - viewsMovement);
    
    self.hourLabel1.center = CGPointMake(self.hourLabel1.center.x - viewsMovement, self.hourLabel1.center.y);
    
    self.hour2.center = CGPointMake(self.hour2.center.x - viewsMovement, self.hour1.center.y);
    self.hourLabel2.center = CGPointMake(self.hourLabel2.center.x - viewsMovement, self.hourLabel2.center.y);
}

-(void)moving{
    
    if (self.hour1.center.x < -200){
        self.hour1.center = CGPointMake(+320, self.hour1.center.y);
    }
    
    if (self.hourLabel1.center.x < -200) {
        self.hourLabel1.center = CGPointMake(+320, self.hourLabel1.center.y);
    }
    
    if (self.hour2.center.x < -200){
        self.hour2.center = CGPointMake(+320, self.hour2.center.y);
    }
    
    if (self.hourLabel2.center.x < -200) {
        self.hourLabel2.center = CGPointMake(+320, self.hourLabel2.center.y);
    }
    
    [self platformMovement];
}

@end
