//
//  NOSRecruitmentListViewModel.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/10/27.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import "NOSRecruitmentListViewModel.h"

#import "NOSRecruitmentCellViewModel.h"
#import "NOSRecruitment.h"
#import "NOSModelContants.h"
#import <LinqToObjectiveC/NSArray+LinqExtensions.h>

@implementation NOSRecruitmentListViewModel

- (instancetype)init {
    self = [super init];

    if (self) {
        [self initialize];
    }

    return self;
}

- (void)initialize {
    self.managedObjectContext = [[RKManagedObjectStore defaultStore] mainQueueManagedObjectContext];

    // manully trigger this to initialize recruitments property
    [self controllerDidChangeContent:self.fetchedResultsController];

    self.executeFind = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self loadRecruitmentsSignal];
    }];

    self.findErrors = self.executeFind.errors;
}

- (RACSignal *)loadRecruitmentsSignal {
    return [NOSRecruitment findAllSignal];
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity =
        [NSEntityDescription entityForName:NOSRecruitmentEntityName inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];

    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];

    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    NSArray *sortDescriptors = @[ sortDescriptor ];

    [fetchRequest setSortDescriptors:sortDescriptors];

    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController =
        [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                            managedObjectContext:self.managedObjectContext
                                              sectionNameKeyPath:nil
                                                       cacheName:@"RecruitmentMaster"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;

    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a
        // shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    return _fetchedResultsController;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    self.recruitments = [controller.fetchedObjects linq_select:^id(id item) {
        return [[NOSRecruitmentCellViewModel alloc] initWithRecruitment:item];
    }];
}

@end
