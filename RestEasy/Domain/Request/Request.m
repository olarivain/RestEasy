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
#pragma mark Content-Type
- (NSString *) contentType
{
    return [self headerWithName: @"Content-Type"].value;
}

- (void) setContentType:(NSString *) contentType
{
    Header *existingHeader = [self headerWithName: @"Content-Type"];
    // nil content-type means we're removing the header
    if(contentType == nil)
    {
        [_headers removeObject: existingHeader];
        return;
    }
    
    // if an existing header exists, update it
    if(existingHeader != nil)
    {
        existingHeader.value = contentType;
        return;
    }
    
    // otherwise create it and insert it as the very first
    Header *header = [Header headerWithName: @"Content-Type" value: contentType];
    [_headers insertObject: header atIndex: 0];
}

#pragma mark Accept
- (NSString *) accept
{
    return [self headerWithName: @"Accept"].value;
}

- (void) setAccept:(NSString *)accept
{
    Header *existingHeader = [self headerWithName: @"Accept"];
    
    // nil accept means we should remove the header, so do that
    if(accept == nil)
    {
        [_headers removeObject: existingHeader];
        return;
    }
    
    // a header already exist, just update it
    if(existingHeader != nil)
    {
        existingHeader.value = accept;
        return;
    }
    
    // otherwise we have to create a header
    Header *header = [Header headerWithName: @"Accept" value: accept];
    // and insert it AFTER content type
    NSInteger contentTypeIndex = [_headers indexOfObject: [self headerWithName: @"Content-Type"]];
    NSInteger index = contentTypeIndex != NSNotFound ? contentTypeIndex + 1 : 0;
    [_headers insertObject: header atIndex: index];
}

#pragma mark - Headers <-> String conversion
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
