//
//  NOSCollege+CoreDataProperties.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/28.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NOSCollege.h"

NS_ASSUME_NONNULL_BEGIN

@interface NOSCollege (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<NOSRecruitment *> *recruitments;

@end

@interface NOSCollege (CoreDataGeneratedAccessors)

- (void)addRecruitmentsObject:(NOSRecruitment *)value;
- (void)removeRecruitmentsObject:(NOSRecruitment *)value;
- (void)addRecruitments:(NSSet<NOSRecruitment *> *)values;
- (void)removeRecruitments:(NSSet<NOSRecruitment *> *)values;

@end

NS_ASSUME_NONNULL_END
