//
//  NOSRecruitmentListViewModel.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/10/27.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface NOSRecruitmentListViewModel : NSObject <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSArray *recruitments;
@property (nonatomic, strong) RACCommand *executeFind;
@property (strong, nonatomic) RACSignal *findErrors;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
