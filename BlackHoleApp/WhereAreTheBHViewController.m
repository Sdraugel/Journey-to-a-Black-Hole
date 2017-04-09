//
//  WhereAreTheBHViewController.m
//  WhereAreTheBlackHoles
//
//  Created by Work on 6/9/14.
//  Copyright (c) 2014 Winslow DiBona. All rights reserved.
//

#import "WhereAreTheBHViewController.h"
#import "WhereAreTheBHScene.h"

@interface WhereAreTheBHViewController()


@end

SKView *skView;

@implementation WhereAreTheBHViewController

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    //Configure the view
    skView = (SKView *)self.view;
    
    //set the view only once, if the device orientation is
    //rotating viewWillLayoutSubviews will be called again
    
    if (!skView.scene)
    {
        skView.showsFPS = NO;
        skView.showsNodeCount = NO;
        
        //Create and configure the scene.
        SKScene * scene = [WhereAreTheBHScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        //Present the scene
        [skView presentScene:scene];
    }
}



- (IBAction)backToMain:(id)sender
{
    [WhereAreTheBHScene backPushed];
}








//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
