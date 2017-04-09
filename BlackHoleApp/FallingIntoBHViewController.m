//
//  FallingIntoBHViewController.m
//  FallingIntoBH
//
//  Created by mac on 6/16/14.
//  Copyright (c) 2014 Steven Draugel. All rights reserved.
//

#import "FallingIntoBHViewController.h"


@implementation FallingIntoBHViewController
SKScene * scene;
SKView * skView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Configure the view.
    skView = (SKView *)self.view;
    //skView.showsFPS = NO;
    //skView.showsNodeCount = NO;
    
    // Create and configure the scene.
    scene = [FallingIntoBHScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    [self updateViewConstraints];
    
}
- (IBAction)go:(id)sender {
    [FallingIntoBHScene go];
    
}
- (IBAction)pause:(id)sender {
    [FallingIntoBHScene stop];
}

- (IBAction)reverse:(id)sender {
    [FallingIntoBHScene reverse];
}

- (IBAction)reset:(id)sender {
    [FallingIntoBHScene reset];
}

- (IBAction)BackToMain:(id)sender{
    //[FallingIntoBHScene reset];
    //[self.view removeFromSuperview];
    
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
