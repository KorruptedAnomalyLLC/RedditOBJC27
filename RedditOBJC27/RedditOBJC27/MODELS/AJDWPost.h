//
//  AJDWPost.h
//  RedditOBJC27
//
//  Created by Austin West on 7/3/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AJDWPost : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image;

-(instancetype)initWithTitle:(NSString *)title
                        name:(NSString *)name
image:(NSString *)image;

@end

@interface AJDWPost (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
