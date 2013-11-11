//
//  Header.h
//  RestEasy
//
//  Created by Olivier Larivain on 11/10/13.
//  Copyright (c) 2013 kra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Header : NSObject

+ (Header *) headerWithName: (NSString *) name value: (NSString *) value;

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *value;

@end
