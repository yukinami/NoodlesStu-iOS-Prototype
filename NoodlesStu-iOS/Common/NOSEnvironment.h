//
//  NOSConfig.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/23.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//

#define kNOSEnvironmentDevelop 0
#define kNOSEnvironmentTest 1
#define kNOSEnvironmentProduction 2

// Use production by default
#ifndef CD_ENVIRONMENT
    #ifdef DEBUG
        #define CD_ENVIRONMENT kNOSEnvironmentDevelop
    #else
        #define CD_ENVIRONMENT kNOSEnvironmentProduction
    #endif
#endif

#import <Foundation/Foundation.h>

@interface NOSEnvironment : NSObject

@property(nonatomic, readonly) NSString *APIBaseURL;

/**
 *  get the NOSConfig instance
 *
 *  @return id
 */
+ (id)sharedConfig;

@end
