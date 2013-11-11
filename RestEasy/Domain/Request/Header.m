//
//  Header.m
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import "Header.h"

@interface Header ()
@property (nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) NSString *value;
@end

@implementation Header

+ (Header *) headerWithName: (NSString *) name value: (NSString *) value
{
    return [[self alloc] initWithName: name value: value];
}

- (id) initWithName: (NSString *) name value: (NSString *) value
{
    self = [super self];
    if(self) {
        self.name = name;
        self.value = value;
    }
    
    return self;
}

@end
