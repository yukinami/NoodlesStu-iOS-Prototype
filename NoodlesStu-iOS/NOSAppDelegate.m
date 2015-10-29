//
//  AppDelegate.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/21.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//

#import "NOSAppDelegate.h"

#import <RestKit/RestKit.h>
#import "NOSEnvironment.h"
#import "NOSRecruitment.h"
#import "NOSErrorMessage.h"


@interface NOSAppDelegate ()

/**
 *  configure RKObjectManger of Restkit
 */
- (void) configRKObjectManager;

@end

@implementation NOSAppDelegate

- (void) configRKObjectManager {
    NSError *error = nil;
    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"NoodlesStu_iOS" ofType:@"momd"]];
    // NOTE: Due to an iOS 5 bug, the managed object model returned is immutable.
    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    
    // Initialize the Core Data stack
    [managedObjectStore createPersistentStoreCoordinator];
    
     NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"cache.sqlite"];
    NSPersistentStore __unused *persistentStore = [managedObjectStore addSQLitePersistentStoreAtPath:storePath fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:&error];
    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);
    
    [managedObjectStore createManagedObjectContexts];
    
    // Set the default store shared instance
    [RKManagedObjectStore setDefaultStore:managedObjectStore];
    
    
    // Configure the object manager
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:[[NOSEnvironment sharedConfig] APIBaseURL]]];
    objectManager.managedObjectStore = managedObjectStore;
    
    [RKObjectManager setSharedManager:objectManager];
    
    // Configure Entity Mapping
    [NOSRecruitment registWithObjectManager:objectManager];
    [NOSErrorMessage registWithObjectManager:objectManager];

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOption {
    
    [self configRKObjectManager];

    return YES;
}


@end
