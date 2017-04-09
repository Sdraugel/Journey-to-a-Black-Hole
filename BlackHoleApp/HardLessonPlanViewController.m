//
//  HardLessonPlanViewController.m
//  BlackHoleApp
//
//  Created by Work on 5/29/14.
//  Copyright (c) 2014 Work. All rights reserved.
//

#import "HardLessonPlanViewController.h"

@interface HardLessonPlanViewController (){
    MPMoviePlayerController *mpc;
}

@end

@implementation HardLessonPlanViewController
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
    NSString *stringPath = [[NSBundle mainBundle] pathForResource:@"NASA-BHSimulation" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:stringPath];
    mpc= [[MPMoviePlayerController alloc]initWithContentURL:url];
    [mpc setMovieSourceType:MPMovieSourceTypeFile];
    [[self view]addSubview:mpc.view];
    [mpc setFullscreen:YES];
    [mpc play];
}

- (IBAction)playVid2:(id)sender {
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

- (IBAction)toEHT:(id)sender {
}

- (IBAction)backToSeeing:(id)sender {
}

- (IBAction)backToWhat:(id)sender {
}
- (IBAction)readStory:(id)sender {
}
- (IBAction)toMain:(id)sender {
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
