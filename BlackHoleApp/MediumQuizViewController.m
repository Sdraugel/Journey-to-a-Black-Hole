//
//  MediumQuizViewController.m
//  Testing
//
//  Created by Work on 6/11/14.
//  Copyright (c) 2014 Winslow DiBona. All rights reserved.
//

#import "MediumQuizViewController.h"

@interface MediumQuizViewController ()

@end

@implementation MediumQuizViewController

NSString *questionFile;
NSString *questionFileContents;
NSArray *questionBank;
NSString *answerFile;
NSString *answerFileContents;
NSArray *answerBank;
NSString *finalScore;


NSString *wrong;
NSMutableArray *wrongQuestions;
NSMutableArray *numbers;

bool tf;

@synthesize score;
@synthesize number;



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
    
    //Initialize the arrays that will be used
    numbers = [NSMutableArray arrayWithArray:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
    wrongQuestions = [[NSMutableArray alloc] init];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Display the first question
    [self displayQuestion];
}

//Grabs a random number out of the available question numbers
- (NSString *) randomNum
{
    int index = arc4random() % [numbers count];
    NSString *num = [numbers objectAtIndex:index];
    [numbers removeObjectAtIndex:index];
    return num;
}



-(void) displayQuestion
{
    //increment which number question the user is on
    number++;
    
    answer3.enabled=YES;
    answer4.enabled=YES;
    
    //Set all answers to false
    a1Correct=NO;
    a2Correct=NO;
    a3Correct=NO;
    a4Correct=NO;
    tf=NO;
    
    //obtain a random number to decide which question will be displayed
    NSString *questionNumber = [self randomNum];
    int num = [questionNumber intValue];
    
    
    switch (num) {
        case 0:
            question.text = @"What is the 'center' of a black hole called?";
            [answer1 setTitle:@"Singularity" forState:UIControlStateNormal];
            [answer2 setTitle:@"Event Horizon" forState:UIControlStateNormal];
            [answer3 setTitle:@"Ergosphere" forState:UIControlStateNormal];
            [answer4 setTitle:@"Star" forState:UIControlStateNormal];
            a1Correct = YES;
            break;
        case 1:
            question.text = @"Which of the following can escape a black hole?";
            [answer1 setTitle:@"A puppy" forState:UIControlStateNormal];
            [answer2 setTitle:@"Light" forState:UIControlStateNormal];
            [answer3 setTitle:@"Santa" forState:UIControlStateNormal];
            [answer4 setTitle:@"None of the Above" forState:UIControlStateNormal];
            a4Correct = YES;
            break;
            
        case 2:
            question.text = @"What forms a black hole?";
            [answer1 setTitle:@"The birth of a star" forState:UIControlStateNormal];
            [answer2 setTitle:@"The death of a star" forState:UIControlStateNormal];
            [answer3 setTitle:@"A dynamite explosion" forState:UIControlStateNormal];
            [answer4 setTitle:@"None of the Above" forState:UIControlStateNormal];
            a2Correct = YES;
            break;
            
        case 3:
            question.text = @"What is the point of no escape of a black hole?";
            [answer1 setTitle:@"Singularity" forState:UIControlStateNormal];
            [answer2 setTitle:@"Ergosphere" forState:UIControlStateNormal];
            [answer3 setTitle:@"Event Horizon" forState:UIControlStateNormal];
            [answer4 setTitle:@"None of the Above" forState:UIControlStateNormal];
            a3Correct = YES;
            break;
        case 4:
            question.text = @"What is the 'death' of a star called?";
            [answer1 setTitle:@"Funeral" forState:UIControlStateNormal];
            [answer2 setTitle:@"Supernovae" forState:UIControlStateNormal];
            [answer3 setTitle:@"Super-explosion" forState:UIControlStateNormal];
            [answer4 setTitle:@"None of the Above" forState:UIControlStateNormal];
            a2Correct = YES;
            break;
        case 5:
            question.text = @"True or False: We can see black holes with telescopes.";
            [answer1 setTitle:@"True" forState:UIControlStateNormal];
            [answer2 setTitle:@"False" forState:UIControlStateNormal];
            [answer3 setTitle:@" " forState:UIControlStateNormal];
            [answer4 setTitle:@" " forState:UIControlStateNormal];
            a2Correct = YES;
            tf=YES;
            break;
        case 6:
            question.text = @"If a black hole is spinning, what extra feature does it have?";
            [answer1 setTitle:@"Singularity" forState:UIControlStateNormal];
            [answer2 setTitle:@"Ergosphere" forState:UIControlStateNormal];
            [answer3 setTitle:@"Event Horizon" forState:UIControlStateNormal];
            [answer4 setTitle:@"Orbit" forState:UIControlStateNormal];
            a2Correct = YES;
            break;
        case 7:
            question.text = @"True or False: We find black holes by examining their effects on the environment around them.";
            [answer1 setTitle:@"True" forState:UIControlStateNormal];
            [answer2 setTitle:@"False" forState:UIControlStateNormal];
            [answer3 setTitle:@" " forState:UIControlStateNormal];
            [answer4 setTitle:@" " forState:UIControlStateNormal];
            a1Correct = YES;
            tf=YES;
            break;
        case 8:
            question.text = @"Is the density of a black hole singularity infinite because its mass is so big or because its volume is so small?";
            [answer1 setTitle:@"Mass is so big" forState:UIControlStateNormal];
            [answer2 setTitle:@"Volume is so small" forState:UIControlStateNormal];
            [answer3 setTitle:@" " forState:UIControlStateNormal];
            [answer4 setTitle:@" " forState:UIControlStateNormal];
            a2Correct = YES;
            tf=YES;
            break;
        case 9:
            question.text = @"Very hot gas emits what type of light just before it crosses the event horizon?";
            [answer1 setTitle:@"Gamma Rays" forState:UIControlStateNormal];
            [answer2 setTitle:@"UV Rays" forState:UIControlStateNormal];
            [answer3 setTitle:@"X-Rays" forState:UIControlStateNormal];
            [answer4 setTitle:@"Radio waves" forState:UIControlStateNormal];
            a3Correct = YES;
            break;
            
        default:
            break;
    }
    if(tf)
    {
        answer3.enabled=NO;
        answer4.enabled=NO;
    }
    
}


// If the answer is right add a point
// If not add the question that the user got wrong to the array containing all the question they have gotten wrong
// If they finished the last question call the finishQuiz() method
// Else present the next question

- (IBAction)answer1:(id)sender {
    if (a1Correct) {
        score++;
    }
    else
    {
        wrong = question.text;
        [wrongQuestions addObject:wrong];
    }
    
    
    if (number == 8) {
        [self finishQuiz];
    }else{[self displayQuestion];}
}

- (IBAction)answer2:(id)sender {
    if (a2Correct) {
        score++;
    }
    else
    {
        wrong = question.text;
        [wrongQuestions addObject:wrong];
    }
    
    if (number == 8) {
        [self finishQuiz];
    }
    else{[self displayQuestion];}
}

- (IBAction)answer3:(id)sender {
    if (a3Correct) {
        score++;
    }
    else
    {
        wrong = question.text;
        [wrongQuestions addObject:wrong];
    }
    
    if (number == 8) {
        [self finishQuiz];
    }
    else{[self displayQuestion];}
}

- (IBAction)answer4:(id)sender {
    if (a4Correct) {
        score++;
    }
    else
    {
        wrong = question.text;
        [wrongQuestions addObject:wrong];
    }
    
    if (number == 8)
    {
        [self finishQuiz];
    }
    else{[self displayQuestion];}
}


// Display the final score as well as the questions the user got wrong
-(void) finishQuiz
{
    finalScore = [NSString stringWithFormat:@"%d/%d Correct", score,number];
    question.text=finalScore;
    
    [answer1 removeFromSuperview];
    [answer2 removeFromSuperview];
    [answer3 removeFromSuperview];
    [answer4 removeFromSuperview];
    
    
    long numLabels = [wrongQuestions count];

    int x = 312;
    int y = 200;
    int width = 450;
    int height = 30;
    for(int i =0; i < numLabels; i++)
    {
        questionText = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        questionText.text = [wrongQuestions objectAtIndex:i];
        questionText.textColor = [UIColor redColor];
        [questionText setFont:[UIFont fontWithName:@"Chalkduster" size:15]];
        [self.view addSubview:questionText];
        y=y+30;
    }

    numbers = [NSMutableArray arrayWithArray:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
    score=0;
    number=0;
    
}


- (IBAction)backToQuizzes:(id)sender {
    numbers = [NSMutableArray arrayWithArray:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
    score=0;
    number=0;
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
