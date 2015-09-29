//
//  AppDelegate.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/21.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface NOSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/*
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
*/

@end

