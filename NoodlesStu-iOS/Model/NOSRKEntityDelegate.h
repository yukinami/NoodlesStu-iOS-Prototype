//
//  NOSRKEntityDelegate.h
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/28.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <RestKit/RestKit.h>

@protocol NOSRKEntityDelegate <NSObject>

/**
 *  get the entity mapping
 *
 *  @param managedObjectStore RKManagedObjectStore
 *
 *  @return RKEntityMapping
 */
+ (RKEntityMapping *) entityMapping:(RKManagedObjectStore *) managedObjectStore;

/**
 *  regist RKObjectManager with RKResponseDescriptor
 *
 *  @param objectManager RKObjectManager
 */
+ (void) registWithObjectManager:(RKObjectManager *) objectManager;

@end
