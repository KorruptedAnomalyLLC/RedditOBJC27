//
//  AJDWPostController.h
//  RedditOBJC27
//
//  Created by Austin West on 7/3/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AJDWPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface AJDWPostController : NSObject

// Singleton
+(instancetype)sharedController;

// Source of truth
@property (nonatomic, copy) NSArray<AJDWPostController *> *posts;

// Crud Functions
// Fetch Posts
-(void)fetchPosts:(void (^)(BOOL))completion;

@end

NS_ASSUME_NONNULL_END
