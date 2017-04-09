//
//  ViewController.m
//  BlackHoleApp
//
//  Created by mac on 5/19/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "LessonPlansViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
{
    NSTimer *aTimer;
    __weak IBOutlet UIImageView *background;
    float counter;
    __weak IBOutlet UIImageView *starfield;
}
@end

@implementation ViewController
@synthesize background;
@synthesize starfield;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self backgroundTimer];
    
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void) backgroundTimer {
    [self aTime];
    
}

- (void)aTime {
    
    aTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(aTime) userInfo:nil repeats:NO];
    counter++;
    CGAffineTransform rotate1 = CGAffineTransformMakeRotation(counter / 1000.0);
    [background layer].transform = CATransform3DMakeAffineTransform(rotate1);
    CGAffineTransform rotate2 = CGAffineTransformMakeRotation(counter / 1200.0);
    [starfield layer].transform = CATransform3DMakeAffineTransform(rotate2);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SwitchToBH:(id)sender {
}

- (IBAction)SwitchToSSA:(id)sender {
}

- (IBAction)SwitchToWhereAreBHLoc:(id)sender {
}

- (IBAction)JourneyToSgrA:(id)sender {
}

- (IBAction)StudentTesting:(id)sender {
}


- (IBAction)SwitchToInstructions:(id)sender {
}

- (IBAction)BackToMain:(id)sender {
}

- (IBAction)SwitchToFallingIntoBH:(id)sender {
}

- (IBAction)observeFallingIntoBH:(id)sender {
}
- (IBAction)FallingIntoABHMenu:(id)sender {
}

-(BOOL) shouldAutorotate
{
    return YES;
}

-(NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}


@end
