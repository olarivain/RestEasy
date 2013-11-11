//
//  NSObject+Block.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "NSObject+Block.h"

@implementation NSObject (Block)

- (void) rez_performBlockOnMainQueue: (VoidBlock) block
                       withDelay: (NSTimeInterval) delay {
    if(block == NULL) {
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*delay),
                   dispatch_get_main_queue(), block);
}

@end
