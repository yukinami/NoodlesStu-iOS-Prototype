//
//  RecruitmentModelView.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/22.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//

#import "NOSRecruitmentModelView.h"

@implementation NOSRecruitmentModelView

+ (void)findAll:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
        failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure {
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/recruitments" parameters:nil success:success failure:failure];
}

@end
