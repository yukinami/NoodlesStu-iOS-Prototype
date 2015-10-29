//
//  NOSRecruitmentListViewController.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/10/9.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import "NOSRecruitmentListViewModel.h"

@interface NOSRecruitmentListViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NOSRecruitmentListViewModel *viewModel;

@end
