//
//  StudentScienceActivitiesViewController.m
//  BlackHoleApp
//
//  Created by mac on 5/27/14.
//  Copyright (c) 2014 mac. All rights reserved.
//

#import "StudentScienceActivitiesViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface StudentScienceActivitiesViewController ()
{
    NSTimer *aTimer;
    __weak IBOutlet UIImageView *star1;
    float counter;
    __weak IBOutlet UIImageView *star2;
    __weak IBOutlet UIImageView *star3;
    
}

@end

@implementation StudentScienceActivitiesViewController
@synthesize star1;
@synthesize star2;
@synthesize star3;

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
    [self backgroundTimer];
    // Do any additional setup after loading the view.
}

- (void) backgroundTimer {
    [self aTime];
    
}

- (void)aTime {
    
    aTimer = [NSTimer scheduledTimerWithTimeInterval:.001 target:self selector:@selector(aTime) userInfo:nil repeats:NO];
    counter++;
    CGAffineTransform rotate1 = CGAffineTransformMakeRotation(counter / 1900.0);
    [star1 layer].transform = CATransform3DMakeAffineTransform(rotate1);
    CGAffineTransform rotate2 = CGAffineTransformMakeRotation(counter / 2000.0);
    [star2 layer].transform = CATransform3DMakeAffineTransform(rotate2);
    CGAffineTransform rotate3 = CGAffineTransformMakeRotation(counter / 1800.0);
    [star3 layer].transform = CATransform3DMakeAffineTransform(rotate3);
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Easy:(id)sender {
}

- (IBAction)Moderate:(id)sender {
}

- (IBAction)Hard:(id)sender {
}

- (IBAction)BackToMain:(id)sender {    
}

 







@end
