//
//  RequestStore.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/11/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "RequestStore.h"

#import "Request.h"

@interface RequestStore ()

@property (nonatomic, readonly) RequestMethod defaultMethod;
@property (nonatomic, readonly) NSString *defaultContentType;
@property (nonatomic, readonly) NSString *defaultAccept;

@property (nonatomic) Request *currentRequest;
@end

@implementation RequestStore

+ (RequestStore *) sharedInstance
{
    static RequestStore *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RequestStore alloc] init];
    });
    
    return sharedInstance;
}

- (Request *) currentRequest
{
    if (!_currentRequest) {
        _currentRequest = [Request request];
        _currentRequest.method = self.defaultMethod;
        _currentRequest.contentType = self.defaultContentType;
        _currentRequest.accept = self.defaultAccept;
    }
    
    return _currentRequest;
}

#pragma mark - Default method/headers
- (RequestMethod) defaultMethod
{
    return RequestMethodGet;
}

- (NSString *) defaultContentType
{
    return @"application/json";
}

- (NSString *) defaultAccept
{
    return @"application/json";
}

@end
