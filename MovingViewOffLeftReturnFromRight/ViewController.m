//
//  ViewController.m
//  MovingViewOffLeftReturnFromRight

//  Spacing between views is not always equal.
//  Have added space when off the screen.
//  Need to figure out the maths.

// 82% of screen width is equal to 1 hour of time.

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *movement;
    double viewsMovement;
    double distanceBetweenStopAndPlayPauseButtons;
    double distanceBetweenHours;
    CGFloat mainViewWidth;
}

@property (strong, nonatomic)HourIndicator *hour1;
@property (strong, nonatomic)HourIndicator *hour2;
@property (strong, nonatomic) IBOutlet UILabel *hourLabel1;
@property (strong, nonatomic) IBOutlet UILabel *hourLabel2;

@property (strong, nonatomic) IBOutlet UIButton *stopButton;
@property (strong, nonatomic) IBOutlet UIButton *playPauseButton;
@property (strong, nonatomic) IBOutlet UILabel *todaysDateLabel;

@end

@implementation ViewController

//  Goal refactor so two views that show at different times.

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    // Do any additional setup after loading the view, typically from a nib.
    
    movement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moving) userInfo:nil repeats:YES];
    
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
    viewsMovement = 2.0;
    
    // buttons
    [self.playPauseButton setImage:[UIImage imageNamed:@"play 2"] forState:UIControlStateNormal];
    [self.stopButton setImage:[UIImage imageNamed:@"Stop 2"] forState:UIControlStateNormal];
    
    // get the width of the screen
    mainViewWidth = self.view.bounds.size.width;
    
    // get distance between stop and play/pause buttons
    // this will be used to position the hour indicators
    distanceBetweenStopAndPlayPauseButtons = self.playPauseButton.center.x - self.stopButton.center.x;
    
    // Logging centres
    [self logStopButtonCentre];
    [self logPlayPauseButtonCentre];
    [self logDistanceBetweenStopAndPlayPauseButtons];

}

- (void)moving
{    
    // reset hour indicators to right hand edge of screen
    
    if (fabsf(self.hour1.center.x) < fabsf(0.18 * mainViewWidth) && self.hour2.center.x < 0)
    {
        self.hour2.center = CGPointMake(mainViewWidth, self.hour2.center.y);
        self.hourLabel2.center = CGPointMake(mainViewWidth, self.hourLabel2.center.y);
    }
    
    if (fabsf(self.hour2.center.x) < fabsf(0.18 * mainViewWidth) && self.hour1.center.x < 0)
    {
        self.hour1.center = CGPointMake(mainViewWidth, self.hour1.center.y);
        self.hourLabel1.center = CGPointMake(mainViewWidth, self.hourLabel1.center.y);
    }
    
    // move the hour indicators
    [self platformMovement];
}

-(void)platformMovement
{
    
    self.hourLabel1.center = CGPointMake(self.hourLabel1.center.x - viewsMovement, self.hourLabel1.center.y);
    self.hour1.center = CGPointMake(self.hourLabel1.center.x - viewsMovement, self.hour1.center.y);
    
    self.hourLabel2.center = CGPointMake(self.hourLabel2.center.x - viewsMovement, self.hourLabel2.center.y);
    self.hour2.center = CGPointMake(self.hourLabel2.center.x - viewsMovement, self.hour2.center.y);
}



# pragma mark - Finding centre of the stop and play/pause button

- (void)logStopButtonCentre
{
    double stopCentreLocation = self.stopButton.center.x;
    NSLog(@"Stop button centre is %f", stopCentreLocation);
}

- (void)logPlayPauseButtonCentre
{
    double playPauseCentreLocation = self.playPauseButton.center.x;
    NSLog(@"Play/pause button centre is %f", playPauseCentreLocation);
}

- (void)logDistanceBetweenStopAndPlayPauseButtons
{
    distanceBetweenStopAndPlayPauseButtons = self.playPauseButton.center.x - self.stopButton.center.x;
    NSLog(@"Distance between stop and play/pause buttons is %f", distanceBetweenStopAndPlayPauseButtons);
}

@end



