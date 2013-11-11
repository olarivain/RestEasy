//
//  Request.h
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request : NSObject

@property (nonatomic) NSURL *url;
@property (nonatomic) NSDictionary *headers;
@property (nonatomic) NSData *body;

- (id) initWithURL: (NSURL *) url headers: (NSDictionary *) headers body: (id) body;

@end
