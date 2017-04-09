//
//  CostumSegues.m
//  BlackHoleApp
//
//  Created by mac on 7/11/14.
//  Copyright (c) 2014 Winslow DiBona. All rights reserved.
//

#import "CustomSegues.h"
#import "QuartzCore/QuartzCore.h"

@implementation CustomSegues

-(void)perform {
    
    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
    UIViewController *destinationController = (UIViewController*)[self destinationViewController];
    
    CATransition* transition = [CATransition animation];
    transition.duration = .35;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [sourceViewController.navigationController.view.layer addAnimation:transition
                                                                forKey:kCATransition];
    [sourceViewController.navigationController pushViewController:destinationController animated:NO];
    
}

@end
