//
//  Request.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "Request.h"

#import "Header.h"

@interface Request ()
@property (nonatomic, readwrite) NSMutableArray *headers;
@end

@implementation Request

+ (Request *) request
{
    return [[self alloc] init];
}

+ (NSString *) stringFromMethod: (RequestMethod) method
{
    switch (method) {
        case RequestMethodGet:
            return @"GET";
            break;
        case RequestMethodPost:
            return @"POST";
            break;
        case RequestMethodPut:
            return @"PUT";
            break;
        case RequestMethodDelete:
            return @"DELETE";
            break;
        case RequestMethodHead:
            return @"HEAD";
            break;
        default:
            break;
    }
    return nil;
}

- (id) init
{
    self = [super init];
    if(self)
    {
        self.headers = [NSMutableArray arrayWithCapacity: 5];
    }
    return self;
}

#pragma mark - Synthetic getter/setters
- (NSString *) contentType
{
    return [self headerWithName: @"Content-Type"].value;
}

- (void) setContentType:(NSString *) contentType
{
    Header *existingHeader = [self headerWithName: @"Content-Type"];
    
    if(contentType == nil)
    {
        [_headers removeObject: existingHeader];
        return;
    }
    
    if(existingHeader != nil) {
        existingHeader.value = contentType;
        return;
    }
    
    Header *header = [Header headerWithName: @"Content-Type" value: contentType];
    [_headers insertObject: header atIndex: 0];
}

- (NSString *) accept
{
    return [self headerWithName: @"Accept"].value;
}

- (void) setAccept:(NSString *)accept
{
    Header *existingHeader = [self headerWithName: @"Accept"];
    
    if(accept == nil)
    {
        [_headers removeObject: existingHeader];
        return;
    }
    
    if(existingHeader != nil) {
        existingHeader.value = accept;
        return;
    }
    
    Header *header = [Header headerWithName: @"Accept" value: accept];
    
    // insert accept AFTER content type
    Header *contentType = [self headerWithName: @"Content-Type"];
    NSInteger index = contentType != nil ? 1 : 0;
    [_headers insertObject: header atIndex: index];
}

- (NSString *) headersString
{
    NSMutableArray *components = [NSMutableArray arrayWithCapacity: _headers.count];
    
    for(Header *header in self.headers)
    {
        [components rez_addObject: [NSString stringWithFormat: @"%@: %@", header.name, header.value]];
    }
    
    return [components componentsJoinedByString: @"\n"];
}

#pragma mark - Convenience
- (Header *) headerWithName: (NSString *) name
{
    if(name == nil) {
        return nil;
    }
    
    for(Header *header in self.headers.copy) {
        if([header.name caseInsensitiveCompare: name] == NSOrderedSame) {
            return header;
        }
    }
    
    return nil;
}

#pragma mark - Description
- (NSString *) description
{
    NSMutableString *theDescription = [NSMutableString stringWithFormat:@"URL: %@\n", _url.absoluteString];
    [theDescription appendFormat: @"Method: %@\n", [Request stringFromMethod: _method]];
    [theDescription appendFormat: @"Headers: %@", _headers];
    [theDescription appendFormat: @"Body: %@", [[NSString alloc] initWithData: _body encoding: NSUTF8StringEncoding]];
    
    return theDescription;
}

@end
