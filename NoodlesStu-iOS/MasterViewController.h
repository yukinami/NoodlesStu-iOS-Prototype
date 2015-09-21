//
//  MasterViewController.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/21.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

