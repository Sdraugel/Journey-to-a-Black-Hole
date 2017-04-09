//
//  WhereAreTheBHScene.m
//  WhereAreTheBlackHoles
//
//  Created by Work on 6/9/14.
//  Copyright (c) 2014 Winslow DiBona. All rights reserved.
//


#import "WhereAreTheBHScene.h"


@interface WhereAreTheBHScene()

@property (nonatomic, strong) SKSpriteNode *selectedNode;


@end


NSArray *data;
SKSpriteNode *background;
UIViewController *popoverContent;
UIViewController *picPopContent;
UIPopoverController *popoverController;
UIPopoverController *picPopController;

bool backPushed = NO;


@implementation WhereAreTheBHScene



-(id)initWithSize:(CGSize)size
{
    
    if (self = [super initWithSize:size]) {
        
        // Background setup
        background = [SKSpriteNode spriteNodeWithImageNamed:@"milkyWayOverhead.jpg"];
        background.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:background];
        
        
        // Sprite objects setup
        NSString *spriteImage = @"bhSpriteImage.png";
        
        //rotation action
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        //1
        SKSpriteNode *V518 = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [V518 runAction:[SKAction repeatActionForever:action]];
        [V518 setPosition:CGPointMake(-7,-248)];
        [V518 setName:@"V518 Per"];
        [background addChild:V518];
        
        
        //2
        SKSpriteNode *V616 = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [V616 runAction:[SKAction repeatActionForever:action]];
        [V616 setPosition:CGPointMake(33,-176)];
        [V616 setName:@"V616 Mon"];
        [background addChild:V616];
        
        
        //3
        SKSpriteNode *MM = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [MM runAction:[SKAction repeatActionForever:action]];
        [MM setPosition:CGPointMake(105,-190)];
        [MM setName:@"MM Vel"];
        [background addChild:MM];
        
        //4
        SKSpriteNode *KV = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [KV runAction:[SKAction repeatActionForever:action]];
        [KV setPosition:CGPointMake(-36,-205)];
        [KV setName:@"KV UMa"];
        [background addChild:KV];
        
        //5
        SKSpriteNode *GU = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [GU runAction:[SKAction repeatActionForever:action]];
        [GU setPosition:CGPointMake(-79,-238)];
        [GU setName:@"GU Mus"];
        [background addChild:GU];
        
        //6
        SKSpriteNode *IL = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [IL runAction:[SKAction repeatActionForever:action]];
        [IL setPosition:CGPointMake(-156,-124)];
        [IL setName:@"IL Lupi"];
        [background addChild:IL];
        
        //7
        SKSpriteNode *V381 = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [V381 runAction:[SKAction repeatActionForever:action]];
        [V381 setPosition:CGPointMake(65,-69)];
        [V381 setName:@"V381 Nor"];
        [background addChild:V381];
        
        //8
        SKSpriteNode *V1033 = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [V1033 runAction:[SKAction repeatActionForever:action]];
        [V1033 setPosition:CGPointMake(21,-98)];
        [V1033 setName:@"V1033 Sco"];
        [background addChild:V1033];
        
        //9
        SKSpriteNode *V821 = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [V821 runAction:[SKAction repeatActionForever:action]];
        [V821 setPosition:CGPointMake(32,-50)];
        [V821 setName:@"V821 Ara"];
        [background addChild:V821];
        
        //10
        SKSpriteNode *V2107 = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [V2107 runAction:[SKAction repeatActionForever:action]];
        [V2107 setPosition:CGPointMake(16,30)];
        [V2107 setName:@"V2107 Oph"];
        [background addChild:V2107];
        
        //11
        SKSpriteNode *V4641 = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [V4641 runAction:[SKAction repeatActionForever:action]];
        [V4641 setPosition:CGPointMake(-130,-69)];
        [V4641 setName:@"V4641 Sgr"];
        [background addChild:V4641];
        
        //12
        SKSpriteNode *V406 = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [V406 runAction:[SKAction repeatActionForever:action]];
        [V406 setPosition:CGPointMake(-196,-28)];
        [V406 setName:@"V406 Vul"];
        [background addChild:V406];
        
        
        //13
        SKSpriteNode *V1487 = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [V1487 runAction:[SKAction repeatActionForever:action]];
        [V1487 setPosition:CGPointMake(-170,1)];
        [V1487 setName:@"V1487 Aql"];
        [background addChild:V1487];
        
        
        //14
        SKSpriteNode *CYG = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [CYG runAction:[SKAction repeatActionForever:action]];
        [CYG setPosition:CGPointMake(-34,-149)];
        [CYG setName:@"Cyg X-1"];
        [background addChild:CYG];
        
        
        //15
        SKSpriteNode *QZ = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [QZ runAction:[SKAction repeatActionForever:action]];
        [QZ setPosition:CGPointMake(-53,-118)];
        [QZ setName:@"QZ Vul"];
        [background addChild:QZ];
        
        
        //16
        SKSpriteNode *V404 = [SKSpriteNode spriteNodeWithImageNamed: spriteImage];
        [V404 runAction:[SKAction repeatActionForever:action]];
        [V404 setPosition:CGPointMake(-75,-149)];
        [V404 setName:@"V404 Cyg"];
        [background addChild:V404];
        
        
        //17
        SKSpriteNode *Sun = [SKSpriteNode spriteNodeWithImageNamed:@"sun.png"];
        [Sun setPosition:CGPointMake(0, -200)];
        [Sun setName:@"Sun"];
        [background addChild:Sun];
        
        
        //18
        SKSpriteNode *SgrA = [SKSpriteNode spriteNodeWithImageNamed:spriteImage];
        [SgrA setPosition:CGPointMake(0, 0)];
        [SgrA runAction:[SKAction repeatActionForever:action]];
        [SgrA setName:@"Sagittarius A*"];
        [background addChild:SgrA];
        
    }
    return self;
}





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



// Determine the location of touch

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(picPopController.popoverVisible || popoverController.popoverVisible)
    {
        [popoverController dismissPopoverAnimated:YES];
        [picPopController dismissPopoverAnimated:YES];
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint positionInScene = [touch locationInNode: self];
    [self selectNodeForTouch:positionInScene];
    
}



// Based off the given touch location determine which node was selected and gather its data

- (void) selectNodeForTouch:(CGPoint)touchLocation
{
    
    // Data for black hole objects
    NSArray *bhNames = @[@"V518 Per", @"V616 Mon", @"MM Vel", @"KV UMa",
                         @"GU Mus", @"IL Lupi", @"V381 Nor", @"V1033 Sco", @"V821 Ara", @"V2107 Oph",
                         @"V4641 Sgr", @"V406 Vul", @"V1487 Aql", @"Cyg X-1", @"QZ Vul", @"V404 Cyg", @"Sun", @"Sagittarius A*"];
    
    NSArray *bhLowMass = @[@"3.2", @"3.3", @"6.3", @"6.5",
                           @"6.5", @"7.4", @"8.4", @"6.0", @"NA", @"5.6",
                           @"6.8", @"7.6", @"10.0", @"6.9", @"7.1", @"10.1", @"1", @"3.5x10^6"];
    
    NSArray *bhHighMass = @[@"13.2", @"12.9", @"8.0", @"7.2",
                            @"8.2", @"11.4", @"10.8", @"6.6", @"NA", @"8.3",
                            @"7.4", @"12.0", @"18.0", @"13.2", @"7.8", @"13.4", @"1", @"4.7x10^6"];
    
    NSArray *bhSpec = @[@"M2V", @"K4V", @"K7", @"K5",
                        @"K3", @"A2V", @"G8", @"F3", @"NA", @"K3",
                        @"B9", @"NA", @"K", @"O9.7Iab", @"K3", @"K0", @"G2V", @"NA"];
    
    NSArray *bhDistance = @[@"2.6", @"1.2", @"5.0", @"1.8",
                            @"5", @"7.5", @"5.3", @"3.2", @"4", @"8",
                            @"7.4", @"11", @"11", @"2.0", @"2.7", @"2.2", @"4.848x10^-9", @"7.97"];
    
    NSArray *bhPics = @[@"bh1.jpg", @"bh2.jpg", @"bh3.jpg", @"bh4.jpg",
                        @"bh5.jpg", @"bh6.jpg", @"bh7.jpg", @"bh8.jpg", @"bh9.jpg", @"bh10.jpg",
                        @"bh11.jpg", @"bh12.jpg", @"bh13.jpg", @"bh14.jpg", @"bh15.jpg", @"bh16.jpg", @"sun.png", @"sgrA_xrays_mod.jpg"];
    
    NSArray *bhPicsExplanation = @[@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Schematic Diagram",@"Visible Light Image", @"Chadra Observatory X-Ray Image"];
    
    
    
    // Find which node was touched, get that nodes information
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:touchLocation];
    
    for(int i = 0; i < 18; i++)
    {
        if([touchedNode name] == [bhNames objectAtIndex:i])
        {
            NSString *name = [bhNames objectAtIndex:i];
            NSString *lowMass = [bhLowMass objectAtIndex:i];
            NSString *highMass = [bhHighMass objectAtIndex:i];
            NSString *spectrum = [bhSpec objectAtIndex:i];
            NSString *distance = [bhDistance objectAtIndex:i];
            NSString *pic = [bhPics objectAtIndex:i];
            NSString *picExplanation = [bhPicsExplanation objectAtIndex:i];
            

            // Loads a pop up view
            [self loadPopUpView: name : lowMass : highMass : spectrum : distance : pic : picExplanation];
            break;
        }
    }
}





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//create table view for popup to display data in
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableIdentifier=@"Cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:TableIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableIdentifier];
    }
    cell.textLabel.text=[data objectAtIndex:indexPath.row];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.textColor=[UIColor blackColor];
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica" size:18];
    
    return cell;
}





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



// Build the popover controllers and their contents

- (void) loadPopUpView: (NSString *) name :(NSString *) lowMass :(NSString *) highMass :(NSString *) spectrum :(NSString *) distance :(NSString *) pic :(NSString *) picExplanation
{
    //build array for data population of popover
    NSString *n = [NSString stringWithFormat: @"Name: %@", name];
    NSString *m = [NSString stringWithFormat: @"Mass: %@-%@ M☉", lowMass, highMass];
    NSString *s = [NSString stringWithFormat: @"Star Spectrum: %@", spectrum];
    NSString *d = [NSString stringWithFormat: @"Distance: %@ kpc", distance];
    NSString *pE = [NSString stringWithFormat:@"%@", picExplanation];
    UIImage *image = [UIImage imageNamed:pic];
    
    data = @[n,m,s,d,pE];
    
    
    
    //build data popup view
    popoverContent = [[UIViewController alloc] init];
    UITableView *tableView = [[UITableView alloc] initWithFrame: CGRectMake(300,300,0,0) style:UITableViewStylePlain];
    
    UIView *popoverView = [[UIView alloc] initWithFrame:CGRectMake(0,0,300,300)];
    popoverView.backgroundColor = [UIColor whiteColor];
    popoverContent.view = popoverView;
    
    //resize data popover view shown
    popoverContent.preferredContentSize = CGSizeMake(350,220);
    
    //add table view to data popover
    popoverContent.view = tableView;
    
    tableView.delegate=self;
    tableView.dataSource=self;
    
    //create data popover controller
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    //present data popover
    CGRect dataPoint = CGRectMake(850,415,1,1);
    [popoverController presentPopoverFromRect:dataPoint inView:self.view permittedArrowDirections:0 animated:YES];
    
    
    
    //build pic popup view
    picPopContent = [[UIViewController alloc] init];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(886, 396, 0, 0)];
    
    UIView *picPopView = [[UIView alloc] initWithFrame:CGRectMake(0,0,886,396)];
    picPopContent.view = picPopView;
    
    
    //resize pic popover view shown
    [imageView setImage:image];
    picPopContent.preferredContentSize = CGSizeMake(image.size.width,image.size.height);
    
    //add image view to pic popover
    picPopContent.view=imageView;
    
    //create pic popover controller
    picPopController = [[UIPopoverController alloc] initWithContentViewController:picPopContent];
    
    imageView.backgroundColor=[UIColor clearColor];
    picPopController.backgroundColor=[UIColor blackColor];
    picPopView.backgroundColor=[UIColor blackColor];
    
    //present pic popover
    CGRect picPoint = CGRectMake(850, 100, 1, 1);
    [picPopController presentPopoverFromRect:picPoint inView:self.view permittedArrowDirections:0 animated:YES];
    
    // Allow other views to be interacted with
    NSArray *views = @[self.view];
    popoverController.passthroughViews=views;
    picPopController.passthroughViews=views;
}

+ (void) backPushed
{
    backPushed=YES;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if(backPushed)
    {
        [popoverController dismissPopoverAnimated:YES];
        [picPopController dismissPopoverAnimated:YES];
        backPushed = NO;
    }
}

@end