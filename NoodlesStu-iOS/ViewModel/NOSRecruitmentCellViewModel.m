//
//  NOSRecruitmentCellViewModel.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/10/27.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import "NOSRecruitmentCellViewModel.h"
#import "NOSRecruitment+CoreDataProperties.h"
#import "NOSCollege+CoreDataProperties.h"
#import "NOSConstants.h"


@implementation NOSRecruitmentCellViewModel

- (instancetype)initWithRecruitment:(NOSRecruitment *)recruitment {
    self = [super init];
    if (self) {
        _title = recruitment.title;
        _date = recruitment.date;
        _college = recruitment.college.name;
        _position = recruitment.keywords;
        _viewTimes = @259;
    }
    
    return self;
}

- (NSString *) viewTimesText {
    return [NSString stringWithFormat:kLocaleViewTimes, self.viewTimes];
}

- (NSString *) dateText {
    return self.date.description;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:self.class]) {
        NOSRecruitmentCellViewModel *aObject = object;
        return self.title == aObject.title
                && [_date isEqual:aObject.date]
                && _college == aObject.college
                && _position == aObject.position
                && _viewTimes == aObject.viewTimes;
    }
    return false;
}

@end
