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
    NSTimer *timerForTimeline;
    double hourMarkerDistanceToMoveOnXAxis;
    double distanceBetweenStopAndPlayPauseButtons;
    CGFloat screenWidth;
}

@property (strong, nonatomic)HourMarker *hourMarkerLine1;
@property (strong, nonatomic)HourMarker *hourMarkerLine2;
@property (strong, nonatomic) IBOutlet UILabel *hourMarkerLabel1;
@property (strong, nonatomic) IBOutlet UILabel *hourMarkerLabel2;

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
    
    timerForTimeline = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateTimelineOnTimer) userInfo:nil repeats:YES];
    
    // strings are static.  The string should be created in HourIndicator class.
    self.hourMarkerLabel1.text = [NSString stringWithFormat:@"2pm"];
    self.hourMarkerLabel2.text = [NSString stringWithFormat:@"3pm"];
    
    //In CGRectMake
    //first number is x starting points, can use this to set the distance between the views
    //second number is y location, so how high or low on the screen.
    //Last two values are the rectangles size.
    self.hourMarkerLine1 = [[HourMarker alloc] initWithFrame:CGRectMake(315.0f, 92.0f, 2.0f, 10.0f)];
    [self.hourMarkerLine1 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.hourMarkerLine1];
    
    self.hourMarkerLine2 = [[HourMarker alloc] initWithFrame:CGRectMake(75.0f, 92.0f, 2.0f, 10.0f)];
    [self.hourMarkerLine2 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.hourMarkerLine2];

    //Use this variable to set the speed.  If O, does not move.
    hourMarkerDistanceToMoveOnXAxis = 2.0;
    
    // buttons
    [self.playPauseButton setImage:[UIImage imageNamed:@"play 2"] forState:UIControlStateNormal];
    [self.stopButton setImage:[UIImage imageNamed:@"Stop 2"] forState:UIControlStateNormal];
    
    // get the width of the screen
    screenWidth = self.view.bounds.size.width;
    
    // get distance between stop and play/pause buttons
    // this will be used to position the hour indicators
    distanceBetweenStopAndPlayPauseButtons = self.playPauseButton.center.x - self.stopButton.center.x;
}

- (void)updateTimelineOnTimer
{
    [self checkIfHourMarkerShouldBeResetToRightSide];
    [self moveHourMarkers];
}

- (void)checkIfHourMarkerShouldBeResetToRightSide
{
    // reset hour indicators to right hand edge of screen
    
    if (fabsf(self.hourMarkerLine1.center.x) < fabsf(0.18 * screenWidth) && self.hourMarkerLine2.center.x < 0)
    {
        self.hourMarkerLine2.center = CGPointMake(screenWidth, self.hourMarkerLine2.center.y);
        self.hourMarkerLabel2.center = CGPointMake(screenWidth, self.hourMarkerLabel2.center.y);
    }
    
    if (fabsf(self.hourMarkerLine2.center.x) < fabsf(0.18 * screenWidth) && self.hourMarkerLine1.center.x < 0)
    {
        self.hourMarkerLine1.center = CGPointMake(screenWidth, self.hourMarkerLine1.center.y);
        self.hourMarkerLabel1.center = CGPointMake(screenWidth, self.hourMarkerLabel1.center.y);
    }
}

-(void)moveHourMarkers
{
    self.hourMarkerLabel1.center = CGPointMake(self.hourMarkerLabel1.center.x - hourMarkerDistanceToMoveOnXAxis, self.hourMarkerLabel1.center.y);
    self.hourMarkerLine1.center = CGPointMake(self.hourMarkerLabel1.center.x - hourMarkerDistanceToMoveOnXAxis, self.hourMarkerLine1.center.y);
    
    self.hourMarkerLabel2.center = CGPointMake(self.hourMarkerLabel2.center.x - hourMarkerDistanceToMoveOnXAxis, self.hourMarkerLabel2.center.y);
    self.hourMarkerLine2.center = CGPointMake(self.hourMarkerLabel2.center.x - hourMarkerDistanceToMoveOnXAxis, self.hourMarkerLine2.center.y);
}

@end



