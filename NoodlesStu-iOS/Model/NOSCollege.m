//
//  NOSCollege.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/28.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import "NOSCollege.h"
#import "NOSRecruitment.h"

//NSString *const NOSCollegeEntityName = @"College";

@implementation NOSCollege

#pragma mark - NOSRKEntityDelegate

+ (RKEntityMapping *)entityMapping:(RKManagedObjectStore *) managedObjectStore {
    RKEntityMapping *entityMapping = [RKEntityMapping mappingForEntityForName:@"College"
                                                         inManagedObjectStore:managedObjectStore];

    [entityMapping addAttributeMappingsFromDictionary:@{ @"id" : @"id", @"name" : @"name" }];
    return entityMapping;
}

+ (void)registWithObjectManager:(RKObjectManager *)objectManager {
    // TODO implement NOSRKEntityDelegate protocol
}

@end
