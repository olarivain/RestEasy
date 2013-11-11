//
//  RequestStore.h
//  RestEasy
//
//  Created by Olivier Larivain on 11/11/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Request;

@interface RequestStore : NSObject

+ (RequestStore *) sharedInstance;

@property (nonatomic, readonly) Request *currentRequest;

@end
