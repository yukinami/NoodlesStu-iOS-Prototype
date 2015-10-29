//
//  NOSRecruitmentCellViewModel.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/10/27.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NOSRecruitment.h"

@interface NOSRecruitmentCellViewModel : NSObject

- (instancetype) initWithRecruitment:(NOSRecruitment *)recruitment;

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSDate *date;
@property (nonatomic, readonly) NSString *position;
@property (nonatomic, readonly) NSString *college;
@property (nonatomic, readonly) NSNumber *viewTimes;

@property (nonatomic, readonly) NSString *dateText;
@property (nonatomic, readonly) NSString *viewTimesText;


@end
