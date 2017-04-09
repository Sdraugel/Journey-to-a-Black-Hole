//
//  ObserveFallingIntoBHViewController.m
//  BlackHoleApp
//
//  Created by Work on 7/1/14.
//  Copyright (c) 2014 Winslow DiBona. All rights reserved.
//

#import "ObserveFallingIntoBHViewController.h"
#import "ObserveFallingIntoBHScene.h"

@interface ObserveFallingIntoBHViewController ()

@end

@implementation ObserveFallingIntoBHViewController

@synthesize presentScene;
@synthesize slider;
@synthesize label;
@synthesize sliderLabel;
@synthesize blackImage;

ObserveFallingIntoBHScene *scene;

UIView *blackView;
int number =5;

-(void) viewWillAppear:(BOOL)animated
{
    
    
    CGAffineTransform rotateTransform;
    switch ([UIApplication sharedApplication].statusBarOrientation) {
        case UIDeviceOrientationLandscapeLeft:
            rotateTransform = CGAffineTransformMakeRotation(-90*M_PI/180);
            break;
        case UIDeviceOrientationLandscapeRight:
            rotateTransform = CGAffineTransformMakeRotation(90*M_PI/180);
            break;
            
        default:
            break;
    }
    
    rotateTransform = CGAffineTransformTranslate(rotateTransform, +90, -90);
    [self.view setTransform:rotateTransform];
    
    blackView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, self.view.frame.size.height/2, self.view.frame.size.width/2)];
    blackView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:blackView];
    
    [blackView addSubview:presentScene];
    [blackView addSubview:slider];
    [blackView addSubview:label];
    [blackView addSubview:sliderLabel];
    
    blackView.frame=CGRectMake(0, 0, 768, 1024);
    
    presentScene.frame=CGRectMake(369,549,30,30);
    slider.frame=CGRectMake(214, 470, 341, 30);
    label.frame=CGRectMake(281, 392, 206, 21);
    sliderLabel.frame=CGRectMake(604, 474, 42, 21);
    
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGAffineTransform t = self.view.transform;
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation) && t.b && t.c ) {
        [self.view setTransform:CGAffineTransformMakeRotation(0)];
    }
}

- (void)viewDidLoad
{

    self.view.backgroundColor=[SKColor blackColor];
    [super viewDidLoad];

}


- (BOOL)shouldAutorotate
{
    return YES;
}


- (IBAction)slider:(id)sender
{
    number=(slider.value);
    sliderLabel.text=[NSString stringWithFormat:@"%d",number];
}









- (IBAction)back:(id)sender
{
    number=5;
    [ObserveFallingIntoBHScene backPressed];
}


- (IBAction)presentScene:(id)sender {
    // Configure the view.
    self.view.backgroundColor=[UIColor blackColor];
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = NO;
    skView.showsNodeCount = NO;
    
    // Create and configure the scene.
    scene = [ObserveFallingIntoBHScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    
    if (number==5)
    {
        scene.startPosition=5.0;
    }
    if (number==6)
    {
        scene.startPosition=6.0;
    }
    if (number==7)
    {
        scene.startPosition=7.0;
    }
    if (number==8)
    {
        scene.startPosition=8.0;
    }
    if (number==9)
    {
        scene.startPosition=9.0;
    }
    if (number==10)
    {
        scene.startPosition=10.0;
    }
    [presentScene removeFromSuperview];
    [label removeFromSuperview];
    [slider removeFromSuperview];
    [sliderLabel removeFromSuperview];
    [blackImage removeFromSuperview];
    [blackView removeFromSuperview];
    
    // Present the scene.
    [skView presentScene:scene];
}

- (IBAction)toUnits:(id)sender {
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
