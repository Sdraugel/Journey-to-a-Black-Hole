//
//  MiddleLessonPlanViewController.m
//  BlackHoleApp
//
//  Created by Work on 5/29/14.
//  Copyright (c) 2014 Work. All rights reserved.
//

#import "MiddleLessonPlanViewController.h"

@interface MiddleLessonPlanViewController ()
{
    MPMoviePlayerController *mpc;
}

@end

@implementation MiddleLessonPlanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playVid:(id)sender {
    NSString *stringPath = [[NSBundle mainBundle] pathForResource:@"supernova" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:stringPath];
    mpc= [[MPMoviePlayerController alloc]initWithContentURL:url];
    [mpc setMovieSourceType:MPMovieSourceTypeFile];
    [[self view]addSubview:mpc.view];
    [mpc setFullscreen:YES];
    [mpc play];
}



//Basic Navigation throughout lesson plan
- (IBAction)begin:(id)sender {
}
- (IBAction)backToLessonPlans:(id)sender {
}
- (IBAction)next:(id)sender {
}
- (IBAction)back:(id)sender {
}
- (IBAction)readStory:(id)sender {
}
- (IBAction)backToWhat:(id)sender {
}
- (IBAction)toEHT:(id)sender {
}
- (IBAction)backToSeeing:(id)sender {
}
- (IBAction)toMain:(id)sender {
}






@end
