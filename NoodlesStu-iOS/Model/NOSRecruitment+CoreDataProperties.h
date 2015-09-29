//
//  NOSRecruitment+CoreDataProperties.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/28.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NOSRecruitment.h"

NS_ASSUME_NONNULL_BEGIN

@interface NOSRecruitment (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *keywords;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NOSCollege *college;

@end

NS_ASSUME_NONNULL_END
