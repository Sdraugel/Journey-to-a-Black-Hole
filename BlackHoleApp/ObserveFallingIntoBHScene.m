//
//  ObserveFallingIntoBHScene.m
//  BlackHoleApp
//
//  Created by Work on 7/1/14.
//  Copyright (c) 2014 Winslow DiBona. All rights reserved.
//

#import "ObserveFallingIntoBHScene.h"

@implementation ObserveFallingIntoBHScene
//Scene Nodes------------------------------------------------------------------------
SKSpriteNode *astronaut;
SKSpriteNode *background1;
SKSpriteNode *background2;
//Blackhole Constructs---------------------------------------------------------------
CGRect circle;
SKShapeNode *blackhole;
int blackholeSize=2000;
//Actions----------------------------------------------------------------------------
SKAction *backgroundLine;
CGMutablePathRef backgroundPath;
SKAction *redshift;
SKAction *brightnessShift;
SKAction *astroLine;
CGMutablePathRef astroPath;
//Steps------------------------------------------------------------------------------
int numSteps;
int stepsTaken=0;
//Calculation Variables-------------------------------------------------------------
@synthesize startPosition;
double radDistanceAstronaut;
double previousRadDistanceAstronaut;
double currentRadDistanceAstronaut;
double logDistanceChange;
double tElsapse;
double tPrevious;
double Vstart;
double Vr;
double jump;
double duration;
//Brightness Shifting---------------------------------------------------------------
double initialBrightnessMagnitude =1.0;
double brightnessMagnitude;
//Color Shifting--------------------------------------------------------------------
double blue =255;
double green = 255;
double startingWavelength = 530;
double wavelength;
//Misc------------------------------------------------------------------------------
SKLabelNode *tickerLabel;
NSString *tickerText;
SKLabelNode *ticker;
int numTouches=0;
int numTicks = 0;
int startingTick;
NSTimer *timer;
SKLabelNode *timerLabel;
NSString *timerLabelText=@"0";
double t=0.00;
SKLabelNode *instructionsLabel;
bool back = NO;


//----------------------------------------------------------------------------------------------------------------------------------------------------
-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        //Create the background
        background1 = [SKSpriteNode spriteNodeWithImageNamed:@"nightSky.jpg"];
        background1.size=CGSizeMake(768, 3668);
        background1.anchorPoint=CGPointZero;
        background1.position = CGPointMake(0, 1024-3668);
        [self addChild:background1];
        
        background2 = [SKSpriteNode spriteNodeWithImageNamed:@"nightSky2.jpg"];
        background2.size=CGSizeMake(768, 3668);
        background2.anchorPoint=CGPointZero;
        background2.position = CGPointMake(0, background1.position.y - 3668);
        [self addChild:background2];
        
        //Create the astronaut
        astronaut = [[SKSpriteNode alloc] initWithImageNamed:@"astro.png"];
        astronaut.size=CGSizeMake(35, 85);
        astronaut.position = CGPointMake(self.frame.size.width/2, 950);
        [self addChild:astronaut];
        
        //Create the blackhole - Decide where to place the blackhole
        circle = CGRectMake((768-blackholeSize)/2, -(blackholeSize), blackholeSize, blackholeSize);
        blackhole = [[SKShapeNode alloc] init];
        blackhole.path = [UIBezierPath bezierPathWithOvalInRect:circle].CGPath;
        blackhole.fillColor = [UIColor blackColor];
        blackhole.strokeColor = [UIColor whiteColor];
        [self addChild:blackhole];
        
        instructionsLabel = [[SKLabelNode alloc] init];
        instructionsLabel.fontColor=[SKColor whiteColor];
        instructionsLabel.text=@"Touch anywhere on the screen to begin";
        instructionsLabel.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 -200);
        [self addChild:instructionsLabel];
        
        t=Vr-Vstart;
    }
    return self;
}
//----------------------------------------------------------------------------------------------------------------------------------------------------
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    numTouches++;
    if (numTouches==1)
    {
        [instructionsLabel removeFromParent];
        [self setUpValues];
        [self startTimer];
        [self run];
        numTouches=5;
    }
}

-(void) startTimer
{
    SKLabelNode *timeLabel = [[SKLabelNode alloc] init];
    timeLabel.fontColor=[UIColor whiteColor];
    timeLabel.text=@"Time (G*M/c^3)";
    timeLabel.position=CGPointMake(120, (self.frame.size.height/2+30)-220);
    [self addChild:timeLabel];
    
    Vr=Vstart;
    t=Vr-Vstart;
    timerLabelText=[NSString stringWithFormat:@"%.02f",t];
    timerLabel.text=timerLabelText;
}

-(void) setUpValues
{
    blue = 255;
    green = 255;
    startingWavelength=530;
    numTouches=0;
    numTicks=0;
    brightnessMagnitude=initialBrightnessMagnitude;
    
    numSteps=(startPosition*100)-10;
    //Set up values
    //logDistanceChange = (log(startPosition))/numSteps;
    Vstart = (-startPosition)-((2/3)*pow(startPosition,(2/3)))-(2*pow(startPosition,1/2))+(2*log(1+pow(startPosition,1/2)))-(2*log(startPosition-1));
    previousRadDistanceAstronaut=startPosition;
    currentRadDistanceAstronaut=startPosition;
    
    //Set up timer
    timerLabel=[[SKLabelNode alloc] init];
    timerLabel.text=timerLabelText;
    timerLabel.fontColor=[UIColor whiteColor];
    timerLabel.position=CGPointMake(100, (self.frame.size.height/2)-220);
    [self addChild:timerLabel];
    
    //Set up ticker
    tickerLabel=[[SKLabelNode alloc] init];
    tickerLabel.text=@"Distance (r/Rs)";
    tickerLabel.fontColor=[UIColor whiteColor];
    tickerLabel.position=CGPointMake(650, (self.frame.size.height/2+30) - 220);
    [self addChild:tickerLabel];
        
    ticker=[[SKLabelNode alloc] init];
    tickerText=[NSString stringWithFormat:@"%.02f", startPosition];
    ticker.text=tickerText;
    ticker.fontColor=[UIColor whiteColor];
    ticker.position=CGPointMake(700, self.frame.size.height/2 -220);
    [self addChild:ticker];

    
}

//----------------------------------------------------------------------------------------------------------------------------------------------------
-(void) run
{
    if (currentRadDistanceAstronaut>1.9)
    {
        previousRadDistanceAstronaut=[self calcVr:currentRadDistanceAstronaut];
        currentRadDistanceAstronaut=currentRadDistanceAstronaut-0.01;;
        radDistanceAstronaut=[self calcVr:currentRadDistanceAstronaut];
        duration = fabs(fabs(previousRadDistanceAstronaut) - fabs(radDistanceAstronaut));
        [self move];
    }
    else
    {
        [self moveBlackhole];
        [self finish];
    }
    
}

-(double) calcVr : (double) dist
{
    Vr = (-dist)-((2/3)*pow(dist,(2/3)))-(2*pow(dist,1/2))+(2*log(1+pow(dist,1/2)))-(2*log(dist-1));
    return Vr;
}


-(void) move
{
    backgroundPath=CGPathCreateMutable();
    CGPathMoveToPoint(backgroundPath, NULL, 0, 0);
    CGPathAddLineToPoint(backgroundPath, NULL, 0, (1024/100));
    backgroundLine=[SKAction followPath:backgroundPath asOffset:YES orientToPath:NO duration:duration];
    [background1 runAction:backgroundLine];
    [background2 runAction:backgroundLine];
    [self colorShift];
    [self brightnessShift];
    [self performSelector:@selector(run) withObject:self afterDelay:duration];

}

//----------------------------------------------------------------------------------------------------------------------------------------------------
-(void) moveBlackhole
{
    CGMutablePathRef bhPath = CGPathCreateMutable();
    CGPathMoveToPoint(bhPath, NULL, 0, 0);
    CGPathAddLineToPoint(bhPath, NULL, 0, 60);
    SKAction *bhLine = [SKAction followPath:bhPath asOffset:YES orientToPath:NO duration:1.0];
    [blackhole runAction:bhLine];
}


-(void) finish
{
    previousRadDistanceAstronaut=[self calcVr:currentRadDistanceAstronaut];
    currentRadDistanceAstronaut=currentRadDistanceAstronaut-0.01;
    if (currentRadDistanceAstronaut<1.01)
    {
        [self done];
    }
    else
    {
        radDistanceAstronaut=[self calcVr:currentRadDistanceAstronaut];
        duration = fabs(fabs(previousRadDistanceAstronaut) - fabs(radDistanceAstronaut));
        [self astroMove];
    }

}

-(void) astroMove
{
    astroPath=CGPathCreateMutable();
    CGPathMoveToPoint(astroPath, NULL, 0, 0);
    CGPathAddLineToPoint(astroPath, NULL, 0, -(900/100));
    astroLine=[SKAction followPath:astroPath asOffset:YES orientToPath:NO duration:duration];
    [astronaut runAction:astroLine];
    [self colorShift];
    [self brightnessShift];
    [self performSelector:@selector(finish) withObject:self afterDelay:duration];
}

-(void) done
{
    
}

//----------------------------------------------------------------------------------------------------------------------------------------------------
//Redshift the astronaut based off the calculated values
-(void) colorShift
{
    wavelength = startingWavelength * pow((1-(1/currentRadDistanceAstronaut)), (1/2)) * (1+ exp((Vr/2)));
    if (wavelength>530)
    {
        blue = 255 - ((wavelength - 530) * (51/13));
        if (blue < 153)
        {blue = 153;}
    }
    if (wavelength>580)
    {
        green = 255 - ((wavelength-530) *(102/63));
        if (green < 204)
        {green = 204;}
    }
    UIColor *coloring = [UIColor colorWithRed:1 green:(green/255) blue:(blue/255) alpha:1.0];
    redshift = [SKAction colorizeWithColor:coloring colorBlendFactor:1.0 duration:duration];
    [astronaut runAction:redshift];
}
//----------------------------------------------------------------------------------------------------------------------------------------------------
//Fade the astronaut based off the calculated values
-(void) brightnessShift
{
    brightnessMagnitude = initialBrightnessMagnitude * (1/(1+exp(Vr/2)));
    brightnessShift = [SKAction fadeAlphaTo:brightnessMagnitude duration:duration];
    [astronaut runAction:brightnessShift];
}
//----------------------------------------------------------------------------------------------------------------------------------------------------
-(void)update:(CFTimeInterval)currentTime
{
    if (background1.position.y > 1024)
    {
        background1.position = CGPointMake(0, background2.position.y-3667);
    }
    if (background2.position.y > 1024)
    {
        background2.position = CGPointMake(0, background1.position.y-3667);
    }
    
    tickerText=[NSString stringWithFormat:@"%.02f", currentRadDistanceAstronaut];
    ticker.text=tickerText;
    
    if (back)
    {
        numTouches=0;
        t=0.00;
        currentRadDistanceAstronaut=1.00;
        blue = 255;
        green = 255;
        startingWavelength=530;
        numTicks=0;
        brightnessMagnitude=initialBrightnessMagnitude;
        back=NO;
    }

    t=Vr-Vstart;
    timerLabelText=[NSString stringWithFormat:@"%.02f",t];
    timerLabel.text=timerLabelText;    
}

+(void) backPressed
{
    back=YES;
}


@end
