//
//  ViewController.h
//  BlackHoleApp
//
//  Created by mac on 5/19/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UIImageView *starfield;

@property (weak, nonatomic) IBOutlet UIButton *SwitchToBH;

@property (weak, nonatomic) IBOutlet UIButton *SwitchToSSA;

@property (weak, nonatomic) IBOutlet UIButton *SwitchToWhereAreBHLoc;

@property (weak, nonatomic) IBOutlet UIButton *JourneyToSgrA;

@property (unsafe_unretained, nonatomic) IBOutlet UIButton *StudentTesting;

@property (weak, nonatomic) IBOutlet UIButton *SwitchToInstructions;

@property (weak, nonatomic) IBOutlet UIButton *BackToMain;

@property (weak, nonatomic) IBOutlet UIButton *SwitchToFallingIntoBH;

@property (weak, nonatomic) IBOutlet UIButton *observeFallingIntoBH;

@property (weak, nonatomic) IBOutlet UIButton *FallingIntoABHMenu;

@end
