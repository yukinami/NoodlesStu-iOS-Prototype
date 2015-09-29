//
//  NOSErrorMessage.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/25.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <RestKit/RestKit.h>


/**
 A simple class used for representing error messages returned by a remote backend system with which the client application is communicating. Error messages are typically returned in a response body in the Client Error class (status code 4xx range).
 */
@interface NOSErrorMessage : NSObject

@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSString *error;
@property (nonatomic, strong) NSString *exception;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSDate *timestamp;

/**
 *  get the object mapping
 *
 *  @return NSDictionary
 */
+ (RKObjectMapping *)objectMapping;

/**
 *  regist RKObjectManager with RKResponseDescriptor
 *
 *  @param objectManager RKObjectManager
 */
+ (void) registWithObjectManager:(RKObjectManager *) objectManager;

@end
