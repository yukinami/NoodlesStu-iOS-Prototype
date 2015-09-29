//
//  RecruitmentModelView.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/22.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <RestKit/RestKit.h>

@interface NOSRecruitmentModelView : NSObject

/**
 *  find all the recruitments
 *
 *  @param success success block
 *  @param failure failure block
 */
- (void)findAll:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
        failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;

@end
