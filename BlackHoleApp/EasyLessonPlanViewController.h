//
//  EasyLessonPlanViewController.h
//  BlackHoleApp
//
//  Created by Work on 5/29/14.
//  Copyright (c) 2014 Work. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface EasyLessonPlanViewController : ViewController
@property (weak, nonatomic) IBOutlet UIButton *backToLessonPlans;
@property (weak, nonatomic) IBOutlet UIButton *begin;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet UIButton *back;
@property (weak, nonatomic) IBOutlet UIButton *toMain;

- (IBAction)playVid: (id) sender;
@end


