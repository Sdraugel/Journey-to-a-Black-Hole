//
//  Journey.m
//  VideoPlayer
//
//  Created by mac on 6/9/14.
//  Copyright (c) 2014 mac. All rights reserved.
//

#import "Journey.h"

@interface Journey ()
{
    
    
    MPMoviePlayerController *mpc;
    UILabel *label1, *label1a, *label2, *label2a, *label3, *label3a, *label3b, *label4, *label4a, *label4b, *label4c, *label4d, *label4e, *label4f,*label4g,*label4h,*label4i,*label4j, *label4k, *label5, *title;
    NSNotificationCenter *notificationCenter;
    NSTimer *aTimer;
}

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation Journey

int timerCounter = 0;
bool paused = NO;
float currentTime;
int counter;


//A timer that controls when to display information in the video
- (void)aTime {
    
    aTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(aTime) userInfo:nil repeats:NO];
    
    currentTime = mpc.currentPlaybackTime;
    //NSLog(@" currentTime %f", currentTime);
    
    if (currentTime < 1.75 && currentTime > 0.00){
        [self removeLabels];
        [self blankText];
        label1.text = @"We start with a visible light image of the Milky Way galaxy.";
        label1a.text = @"This is what our galaxy looks like from our perspective inside it.";
        [self addLabels];
        counter = 0;
    }
    
    if (currentTime > 1.75 && currentTime < 8.00) {
        [self removeLabels];
        [self blankText];
        label2.text = @"The constellations Sagittarius and Scorpius are visible during the summer months/winter months for the";
        label2a.text = @" north and south hemispheres respectively. Look to the south if you live in the northern hemisphere.";
        [self addLabels];
        counter = 0;
    }
    
    if (currentTime > 8.00 && currentTime < 12.00) {
        [self removeLabels];
        [self blankText];
        [self addLabels];
        
    }
    
    if (currentTime > 12.00 && currentTime < 30.00) {
        [self removeLabels];
        [self blankText];
        label3.text = @"As the movie proceeds, the view gradually shifts to longer wavelengths (from visible to near-infrared).";
        label3a.text = @"This is necessary because the dust and gas between us and the center of the galaxy is very effective";
        label3b.text = @"at blocking out visible light, while infrared radiation can effectively penetrate the dust.";
        [self addLabels];
        counter++;
    }
    
    if (currentTime > 30.00 && currentTime < 49.00) {
        [self removeLabels];
        [self blankText];
        [self addLabels];
    }
    
    if (currentTime > 49.00 && currentTime < 59.00) {
        [self removeLabels];
        [self blankText];
        label4.text = @"This animation shows individual";
        label4a.text = @"stars orbiting around an invisible";
        label4b.text = @"mass at the very center of our";
        label4c.text = @"galaxy. That invisible mass is the";
        label4d.text = @"super massive black hole, Sgr A*.";
        label4e.text = @"Notice that some of the stars have";
        label4f.text = @"now completed full orbits since";
        label4g.text = @"their discovery 20 years ago. By";
        label4h.text = @"contrast, the planet Neptune has";
        label4i.text = @"only recently completed its first";
        label4j.text = @"full orbit  since our discovery of";
        label4k.text = @"it in 1846.";
        [self addLabels];
    }
    
    if (currentTime > 59.00 && currentTime < 79) {
        [self removeLabels];
        [self blankText];
        [self addLabels];
    }
    
    if (currentTime > 79) {
        [self removeLabels];
        [self blankText];
        label5.text = @"What mysteries remain to be discovered about Sgr A* ?";
        [self addLabels];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    float height = self.view.frame.size.height;
    float width = self.view.frame.size.width;
    title = [[UILabel alloc] initWithFrame:CGRectMake(width / 2, height - 1185, 400, 400)];
    title.backgroundColor = [UIColor clearColor];
    title.text = @"Journey to SgrA*";
    title.font = [UIFont fontWithName:@"TimesNewRomanPS-BoldMT" size:40];
    title.textColor = [UIColor greenColor];
    [self.view addSubview:title];
    [self setupLabels];
    [self addLabels];
    
    //Starts the timer
    [self aTime];
    
    //Gets the movie from the resources
    NSString *stringpath = [[NSBundle mainBundle]pathForResource:@"MWCenter" ofType:@"mov"];
    NSURL *url = [NSURL fileURLWithPath:stringpath];
    mpc = [[MPMoviePlayerController alloc]initWithContentURL:url];
    [mpc setMovieSourceType:MPMovieSourceTypeFile];
    
    //Places the movie player mpc into the view
    [[self view]addSubview:mpc.view];
    
    //Sets the size of the player window
    [mpc.view setFrame:CGRectMake(22, 150, 701, 394)];
    mpc.controlStyle = MPMovieControlStyleEmbedded;
    [mpc prepareToPlay];
    [mpc pause];
    
    notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self
                           selector:@selector(playerStateChange:)
                               name:MPMoviePlayerPlaybackStateDidChangeNotification
                             object:mpc];
    
    [notificationCenter addObserver:self
                           selector:@selector(movieEnded:)
                               name:MPMoviePlayerPlaybackDidFinishNotification
                             object:mpc];
    
    [notificationCenter addObserver:self
                           selector:@selector(enterFullscreen:)
                               name:MPMoviePlayerDidEnterFullscreenNotification
                             object:mpc];
    
    [notificationCenter addObserver:self
                           selector:@selector(exitFullscreen:)
                               name:MPMoviePlayerDidExitFullscreenNotification
                             object:mpc];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//For Playing the Video Journey to the center of the Milky Way Galaxy

- (IBAction)back:(id)sender {
}

-(void) playerStateChange:(NSNotification *)notification {
    if (mpc.playbackState == MPMoviePlaybackStatePaused){
        paused = YES;
        [self aTime];
    }
    
    if (mpc.playbackState == MPMoviePlaybackStatePlaying){
        paused = NO;
    }
}

-(void) enterFullscreen:(NSNotification *)notification {
    [self removeLabels];
}

-(void) exitFullscreen:(NSNotification *)notification {
    [self addLabels];
    [mpc play];
}

-(void) movieEnded:(NSNotification *)notification {
    //Stops the timer
    [aTimer invalidate];
}

- (void) removeLabels {
    [label1 removeFromSuperview];
    [label1a removeFromSuperview];
    [label2 removeFromSuperview];
    [label2a removeFromSuperview];
    [label3 removeFromSuperview];
    [label3a removeFromSuperview];
    [label3b removeFromSuperview];
    [label4 removeFromSuperview];
    [label4a removeFromSuperview];
    [label4b removeFromSuperview];
    [label4c removeFromSuperview];
    [label4d removeFromSuperview];
    [label4e removeFromSuperview];
    [label4f removeFromSuperview];
    [label4g removeFromSuperview];
    [label4h removeFromSuperview];
    [label4i removeFromSuperview];
    [label4j removeFromSuperview];
    [label4k removeFromSuperview];
    [label5 removeFromSuperview];
}

- (void) addLabels {
    [self.view addSubview:label1];
    [self.view addSubview:label1a];
    [self.view addSubview:label2];
    [self.view addSubview:label2a];
    [self.view addSubview:label3];
    [self.view addSubview:label3a];
    [self.view addSubview:label3b];
    [self.view addSubview:label4];
    [self.view addSubview:label4a];
    [self.view addSubview:label4b];
    [self.view addSubview:label4c];
    [self.view addSubview:label4d];
    [self.view addSubview:label4e];
    [self.view addSubview:label4f];
    [self.view addSubview:label4g];
    [self.view addSubview:label4h];
    [self.view addSubview:label4i];
    [self.view addSubview:label4j];
    [self.view addSubview:label4k];
    [self.view addSubview:label5];
}

- (void) setupLabels {
    
    label1 = [[UILabel alloc] initWithFrame:CGRectMake(40, 25, 700, 300)];
    label1a = [[UILabel alloc] initWithFrame:CGRectMake(40, 45, 700, 300)];
    label2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 25, 700, 300)];
    label2a = [[UILabel alloc] initWithFrame:CGRectMake(40, 45, 700, 300)];
    label3 = [[UILabel alloc] initWithFrame:CGRectMake(40, 25, 700, 300)];
    label3a = [[UILabel alloc] initWithFrame:CGRectMake(40, 45, 700, 300)];
    label3b = [[UILabel alloc] initWithFrame:CGRectMake(40, 65, 700, 300)];
    label4 = [[UILabel alloc] initWithFrame:CGRectMake(40, 25, 700, 300)];
    label4a = [[UILabel alloc] initWithFrame:CGRectMake(40, 45, 700, 300)];
    label4b = [[UILabel alloc] initWithFrame:CGRectMake(40, 65, 700, 300)];
    label4c = [[UILabel alloc] initWithFrame:CGRectMake(40, 85, 700, 300)];
    label4d = [[UILabel alloc] initWithFrame:CGRectMake(40, 105, 700, 300)];
    label4e = [[UILabel alloc] initWithFrame:CGRectMake(40, 125, 700, 300)];
    label4f = [[UILabel alloc] initWithFrame:CGRectMake(40, 145, 700, 300)];
    label4g = [[UILabel alloc] initWithFrame:CGRectMake(40, 165, 700, 300)];
    label4h = [[UILabel alloc] initWithFrame:CGRectMake(40, 185, 700, 300)];
    label4i = [[UILabel alloc] initWithFrame:CGRectMake(40, 205, 700, 300)];
    label4j = [[UILabel alloc] initWithFrame:CGRectMake(40, 225, 700, 300)];
    label4k = [[UILabel alloc] initWithFrame:CGRectMake(40, 245, 700, 300)];
    label5 = [[UILabel alloc] initWithFrame:CGRectMake(37, 30, 800, 300)];
    
    [self blankText];
    
    label1.font = [UIFont systemFontOfSize:14.5];
    label1.textColor = [UIColor greenColor];
    label1.backgroundColor = [UIColor clearColor];
    label1a.font = [UIFont systemFontOfSize:14.5];
    label1a.textColor = [UIColor greenColor];
    label1a.backgroundColor = [UIColor clearColor];
    label2.font = [UIFont systemFontOfSize:14.5];
    label2.textColor = [UIColor greenColor];
    label2.backgroundColor = [UIColor clearColor];
    label2a.font = [UIFont systemFontOfSize:14.5];
    label2a.textColor = [UIColor greenColor];
    label2a.backgroundColor = [UIColor clearColor];
    label3.font = [UIFont systemFontOfSize:14];
    label3.textColor = [UIColor greenColor];
    label3.backgroundColor = [UIColor clearColor];
    label3a.font = [UIFont systemFontOfSize:14];
    label3a.textColor = [UIColor greenColor];
    label3a.backgroundColor = [UIColor clearColor];
    label3b.font = [UIFont systemFontOfSize:14];
    label3b.textColor = [UIColor greenColor];
    label3b.backgroundColor = [UIColor clearColor];
    label4.font = [UIFont systemFontOfSize:14];
    label4.textColor = [UIColor greenColor];
    label4.backgroundColor = [UIColor clearColor];
    label4a.font = [UIFont systemFontOfSize:14];
    label4a.textColor = [UIColor greenColor];
    label4a.backgroundColor = [UIColor clearColor];
    label4b.font = [UIFont systemFontOfSize:14];
    label4b.textColor = [UIColor greenColor];
    label4b.backgroundColor = [UIColor clearColor];
    label4c.font = [UIFont systemFontOfSize:14];
    label4c.textColor = [UIColor greenColor];
    label4c.backgroundColor = [UIColor clearColor];
    label4d.font = [UIFont systemFontOfSize:14];
    label4d.textColor = [UIColor greenColor];
    label4d.backgroundColor = [UIColor clearColor];
    label4e.font = [UIFont systemFontOfSize:14];
    label4e.textColor = [UIColor greenColor];
    label4e.backgroundColor = [UIColor clearColor];
    label4f.font = [UIFont systemFontOfSize:14];
    label4f.textColor = [UIColor greenColor];
    label4f.backgroundColor = [UIColor clearColor];
    label4g.font = [UIFont systemFontOfSize:14];
    label4g.textColor = [UIColor greenColor];
    label4g.backgroundColor = [UIColor clearColor];
    label4h.font = [UIFont systemFontOfSize:14];
    label4h.textColor = [UIColor greenColor];
    label4h.backgroundColor = [UIColor clearColor];
    label4i.font = [UIFont systemFontOfSize:14];
    label4i.textColor = [UIColor greenColor];
    label4i.backgroundColor = [UIColor clearColor];
    label4j.font = [UIFont systemFontOfSize:14];
    label4j.textColor = [UIColor greenColor];
    label4j.backgroundColor = [UIColor clearColor];
    label4k.font = [UIFont systemFontOfSize:14];
    label4k.textColor = [UIColor greenColor];
    label4k.backgroundColor = [UIColor clearColor];
    label5.font = [UIFont systemFontOfSize:29];
    label5.textColor = [UIColor greenColor];
    label5.backgroundColor = [UIColor clearColor];
}

- (void) blankText {
    label1.text = @" ";
    label1a.text = @" ";
    label2.text = @"   ";
    label2a.text = @"   ";
    label3.text = @"   ";
    label3a.text = @"   ";
    label3b.text = @"   ";
    label4.text = @"   ";
    label4a.text = @"   ";
    label4b.text = @"   ";
    label4c.text = @"   ";
    label4d.text = @"   ";
    label4e.text = @"   ";
    label4f.text = @"   ";
    label4g.text = @"   ";
    label4h.text = @"   ";
    label4i.text = @"   ";
    label4j.text = @"   ";
    label4k.text = @"   ";
    label5.text = @"   ";
}

@end