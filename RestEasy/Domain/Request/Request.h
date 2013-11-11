//
//  Request.h
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum RequestMethod{
    GET = 0,
    POST = 1,
    PUT = 2,
    DELETE = 3,
    HEAD = 4
} RequestMethod;

@interface Request : NSObject

+ (Request *) requestWithURL: (NSURL *) url method: (RequestMethod) method headers: (NSDictionary *) headers body: (id) body;

@property (nonatomic) NSURL *url;
@property (nonatomic) RequestMethod method;
@property (nonatomic) NSDictionary *headers;
@property (nonatomic) NSData *body;

@end
