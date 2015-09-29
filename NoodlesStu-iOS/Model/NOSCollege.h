//
//  NOSCollege.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/28.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <RestKit/RestKit.h>
#import "NOSRKEntityDelegate.h"

@class NOSRecruitment;

NS_ASSUME_NONNULL_BEGIN

@interface NOSCollege : NSManagedObject <NOSRKEntityDelegate>

@end

NS_ASSUME_NONNULL_END

#import "NOSCollege+CoreDataProperties.h"
