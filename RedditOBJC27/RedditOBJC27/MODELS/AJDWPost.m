//
//  AJDWPost.m
//  RedditOBJC27
//
//  Created by Austin West on 7/3/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import "AJDWPost.h"

@implementation AJDWPost

- (instancetype)initWithTitle:(NSString *)title name:(NSString *)name image:(nonnull NSString *)image {
    
    self = [super init];
    if (self) {
        _title = title;
        _name = name;
        _image = image;
    }
    return self;
}

@end

@implementation AJDWPost (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *title = dictionary[@"title"];
    NSString *name = dictionary[@"author"];
    NSString *image = dictionary[@"thumbnail"];
    
    
    return [self initWithTitle:title name:name image:image];
}

@end
