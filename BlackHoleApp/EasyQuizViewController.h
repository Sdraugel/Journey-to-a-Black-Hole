//
//  EasyQuizViewController.h
//  Testing
//
//  Created by Work on 6/10/14.
//  Copyright (c) 2014 Winslow DiBona. All rights reserved.
//

#import <UIKit/UIKit.h>



bool a1Correct;
bool a2Correct;
bool a3Correct;
bool a4Correct;


@interface EasyQuizViewController : UIViewController
{
    IBOutlet UILabel *question;
    IBOutlet UIButton *answer1;
    IBOutlet UIButton *answer2;
    IBOutlet UIButton *answer3;
    IBOutlet UIButton *answer4;
    IBOutlet UILabel *questionText;
    
}
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *backToQuizzes;

@property int score;
@property int number;

@end
