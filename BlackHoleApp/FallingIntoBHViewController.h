//
//  FallingIntoBHViewController.h
//  FallingIntoBH
//
//  Created by mac on 6/16/14.
//  Copyright (c) 2014 Steven Draugel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "FallingIntoBHScene.h"

@interface FallingIntoBHViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *go;
@property (weak, nonatomic) IBOutlet UIButton *pause;
@property (weak, nonatomic) IBOutlet UIButton *reverse;
@property (weak, nonatomic) IBOutlet UIButton *reset;
@property (weak, nonatomic) IBOutlet UIButton *BackToMain;

@end
