//
//  MGDMyScene.m
//  DebugSpriteLeak
//
//  Created by Christopher Evans on 3/31/14.
//  Copyright (c) 2014 Morphosis Games. All rights reserved.
//

#import "MGDMyScene.h"

@implementation MGDMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor blackColor];
        
        NSString* particlePath = [[NSBundle mainBundle] pathForResource:@"fire" ofType:@"sks"];
        SKEmitterNode* emitter = [NSKeyedUnarchiver unarchiveObjectWithFile:particlePath];
        emitter.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:emitter];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
