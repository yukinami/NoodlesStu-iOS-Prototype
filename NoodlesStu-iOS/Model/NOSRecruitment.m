//
//  NOSRecruitment.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/28.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import "NOSRecruitment.h"
#import "NOSCollege.h"
#import "NOSModelContants.h"

@implementation NOSRecruitment

+ (RKEntityMapping *)entityMapping:(RKManagedObjectStore *)managedObjectStore {
    RKEntityMapping *entityMapping = [RKEntityMapping mappingForEntityForName:NOSRecruitmentEntityName
                                                         inManagedObjectStore:managedObjectStore];

    [entityMapping addAttributeMappingsFromDictionary:@{
        @"id" : @"id",
        @"title" : @"title",
        @"address" : @"address",
        @"date" : @"date",
        @"keywords" : @"keywords"
    }];
    
    [entityMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"college" toKeyPath:@"college" withMapping:[NOSCollege entityMapping:managedObjectStore]]];

    return entityMapping;
}

+ (void)registWithObjectManager:(RKObjectManager *)objectManager {
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[NOSRecruitment entityMapping:objectManager.managedObjectStore]
                                                 method:RKRequestMethodGET
                                            pathPattern:@"/recruitments"
                                                keyPath:@"_embeded.recruitmentList"
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [objectManager addResponseDescriptor:responseDescriptor];
}

+ (RACSignal *)findAllSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[RKObjectManager sharedManager] getObjectsAtPath:@"/recruitments"
                                               parameters:nil
                                                  success:^void (RKObjectRequestOperation *operation,RKMappingResult *mappingResult) {
                                                      [subscriber sendNext:RACTuplePack(operation, mappingResult)];
                                                      [subscriber sendCompleted];
                                                  }
                                                  failure:^void (RKObjectRequestOperation *operation, NSError *error) {
                                                      [subscriber sendError:error];
                                                      [subscriber sendCompleted];
                                                  }];
        
        return nil;
    }];
}

@end
