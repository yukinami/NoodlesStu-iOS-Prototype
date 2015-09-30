//
//  NOSConfig.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/23.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//

#import "NOSConfig.h"

@interface NOSConfig ()

@property (nonatomic) NSDictionary *plistDict;

@end

@implementation NOSConfig


+ (id)sharedConfig {
    static NOSConfig *sharedConfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedConfig = [[self alloc] init];
    });
    return sharedConfig;
}

- (id)init {
    if (self = [super init]) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"NOSConfig" ofType:@"plist"];
        _plistDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];

    }
    return self;
}

- (NSString *)APIBaseURL {
    return _plistDict[@"NOSAPIBaseURL"];
}


@end
