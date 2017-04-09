//
//  ObserveFallingIntoBHViewController.h
//  BlackHoleApp
//
//  Created by Work on 7/1/14.
//  Copyright (c) 2014 Winslow DiBona. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>

@interface ObserveFallingIntoBHViewController : ViewController
@property (weak, nonatomic) IBOutlet UIButton *presentScene;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *back;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UIImageView *blackImage;
@property (weak, nonatomic) IBOutlet UIButton *toUnits;

@end
