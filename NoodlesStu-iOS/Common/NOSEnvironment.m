//
//  NOSConfig.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/23.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//

#import "NOSEnvironment.h"

@interface NOSEnvironment ()

@property(nonatomic) NSDictionary *plistDict;

@end

@implementation NOSEnvironment

+ (id)sharedConfig {
    static NOSEnvironment *sharedConfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedConfig = [[self alloc] init];
    });
    return sharedConfig;
}

- (id)init {
    if (self = [super init]) {

        NSArray *environmentFiles = @[ @"develop", @"test", @"produnction" ];

        NSString *plistPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"NOSEnvironment-%@", environmentFiles[CD_ENVIRONMENT]]
                                                              ofType:@"plist"];
        _plistDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    }
    return self;
}

- (NSString *)APIBaseURL {
    return _plistDict[@"NOSAPIBaseURL"];
}

@end
