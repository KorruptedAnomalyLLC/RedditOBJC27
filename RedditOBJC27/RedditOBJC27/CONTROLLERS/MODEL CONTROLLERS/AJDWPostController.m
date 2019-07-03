//
//  AJDWPostController.m
//  RedditOBJC27
//
//  Created by Austin West on 7/3/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import "AJDWPostController.h"

//https://www.reddit.com
// https://www.reddit.com/r/funny.json


static NSString * const baseURL = @"https://www.reddit.com";

@implementation AJDWPostController

+ (instancetype)sharedController {
    static AJDWPostController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [AJDWPostController new];
    });
    return sharedController;
}

- (void)fetchPosts:(void (^)(BOOL))completion {
    
    NSURL *url = [NSURL URLWithString:baseURL];
    
    [[[url URLByAppendingPathComponent:@"r"]
      URLByAppendingPathComponent:@"funny"]
     URLByAppendingPathExtension:@"json"];
    
    NSLog(@"%@", url);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching post: %@", error);
            completion(false);
            return;
        }
        
        if (!data) {
            NSLog(@"Error with fetched post data");
            completion(false);
            return;
        }
        
        NSDictionary *topLevelDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        // Access the dictionary inside the top level dictionary
        NSDictionary *secondLevelDict = topLevelDict[@"data"];
        
        // Access the array of dictionaries
        NSArray *thirdLevelArray = secondLevelDict[@"children"];
        
        NSMutableArray *tempArray = [NSMutableArray new];
        
        // For In loop
        for (NSDictionary *currentDict in thirdLevelArray) {
            NSDictionary *postDictionary = currentDict[@"data"];
            
            AJDWPost *post = [[AJDWPost alloc] initWithDictionary:postDictionary];
            
            // APpending post objecto to temporary array
            [tempArray addObject:post];
        }
        
        AJDWPostController.sharedController.posts = tempArray;
        completion(true);
    }] resume];
    
}

@end
