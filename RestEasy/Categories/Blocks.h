//
//  Blocks.h
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#ifndef RestEasy_Blocks_h
#define RestEasy_Blocks_h

// common block definitions:
// void block
typedef void(^VoidBlock)(void);

// completion block
typedef void(^CompletionBlock)(BOOL finished);

// nserror block
typedef void(^ErrorBlock)(NSError *error);

#define DispatchMainThread(block, ...) if(block) dispatch_async(dispatch_get_main_queue(), ^{ block(__VA_ARGS__); })
#define InvokeBlock(block, ...) if(block) block(__VA_ARGS__)

#endif
