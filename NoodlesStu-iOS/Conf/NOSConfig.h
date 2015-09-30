//
//  NOSConfig.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/23.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOSConfig : NSObject

@property (nonatomic, readonly) NSString *APIBaseURL;

/**
 *  get the NOSConfig instance
 *
 *  @return id
 */
+ (id)sharedConfig;

@end
