//
//  MainScene.m
//  Main
//
//  Created by mac on 7/9/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene
SKSpriteNode *sprite;
SKAction *action;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor blackColor];
        
        CGPoint location = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        
        sprite = [SKSpriteNode spriteNodeWithImageNamed:@"milky_way.jpg"];
        
        sprite.position = location;
        
        action = [SKAction rotateByAngle:M_PI duration:10];
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    
    
    
}

@end
