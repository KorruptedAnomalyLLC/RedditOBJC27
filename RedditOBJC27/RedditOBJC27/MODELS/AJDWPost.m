//
//  AJDWPost.m
//  RedditOBJC27
//
//  Created by Austin West on 7/3/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import "AJDWPost.h"

@implementation AJDWPost

- (instancetype)initWithTitle:(NSString *)title name:(NSString *)name {
    
    self = [super init];
    if (self) {
        _title = title;
        _name = name;
    }
    return self;
}

@end

@implementation AJDWPost (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *title = dictionary[@"title"];
    NSString *name = dictionary[@"name"];
    
    return [self initWithTitle:title name:name];
}

@end
