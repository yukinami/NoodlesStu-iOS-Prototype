//
//  NOSErrorMessage.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/25.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import "NOSErrorMessage.h"

@implementation NOSErrorMessage

+ (RKObjectMapping *)objectMapping {
    RKObjectMapping *errorMessageMapping = [RKObjectMapping mappingForClass:[self class]];
    [errorMessageMapping addAttributeMappingsFromDictionary:@{
        @"status" : @"status",
        @"error" : @"error",
        @"exception" : @"exception",
        @"message" : @"message",
        @"path" : @"path",
        @"timestamp" : @"timestamp"
    }];
    
    return errorMessageMapping;
}

+ (void)registWithObjectManager:(RKObjectManager *)objectManager {
    // Any response in the 4xx status code range with an "errors" key path uses this mapping
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError);
    RKResponseDescriptor *errorDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[NOSErrorMessage objectMapping]
                                                                                         method:RKRequestMethodAny
                                                                                    pathPattern:nil
                                                                                        keyPath:nil
                                                                                    statusCodes:statusCodes];

    [objectManager addResponseDescriptor:errorDescriptor];
}

@end
