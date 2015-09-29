//
//  RecruitmentMappingTest.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/22.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//



#import "NOSRecruitment.h"
#import "NOSCollege+CoreDataProperties.h"
#import <Specta/Specta.h>
#import <RestKit/Testing.h>
#import <Expecta/Expecta.h>

SpecBegin(Recruitment)

    describe(@"NOSRecruitment", ^{
        
        // Test mapping
        context(@"when is mapped from a json string", ^{

            // Load fixture
            NSBundle *testTargetBundle = [NSBundle bundleWithIdentifier:@"com.hithink.NoodlesStu-iOSTests"];
            [RKTestFixture setFixtureBundle:testTargetBundle];

            // Parse the contents of a fixture using the appropriate parser configured via RKParserRegistry
            id parsedRecruitment = [RKTestFixture parsedObjectWithContentsOfFixture:@"recruitment.json"];

            RKManagedObjectStore *managedObjectStore = [RKTestFactory managedObjectStore];

            RKEntityMapping *entityMapping = [NOSRecruitment entityMapping:managedObjectStore];
            
            
            RKMappingTest *mappingTest =
                [RKMappingTest testForMapping:entityMapping sourceObject:parsedRecruitment destinationObject:nil];
            
            // Configure Core Data
            mappingTest.managedObjectContext = managedObjectStore.persistentStoreManagedObjectContext;

            it(@"should mapped propertly ", ^{
                [mappingTest addExpectation:[RKPropertyMappingTestExpectation expectationWithSourceKeyPath:@"id" destinationKeyPath:@"id" value:@8328]];
                
                [mappingTest addExpectation:[RKPropertyMappingTestExpectation expectationWithSourceKeyPath:@"title" destinationKeyPath:@"title" value:@"铁道第三勘察设计院集团有限公司[招聘会]"]];
                
                [mappingTest addExpectation:[RKPropertyMappingTestExpectation expectationWithSourceKeyPath:@"address" destinationKeyPath:@"address" value:@"YF303"]];
                
                [mappingTest addExpectation:[RKPropertyMappingTestExpectation expectationWithSourceKeyPath:@"keywords" destinationKeyPath:@"keywords" value:@"硕士,工程,建筑,电信,设计"]];
                
                
                [mappingTest addExpectation:[RKPropertyMappingTestExpectation expectationWithSourceKeyPath:@"college" destinationKeyPath:@"college" evaluationBlock:^BOOL(RKPropertyMappingTestExpectation *expectation, RKPropertyMapping *mapping, NOSCollege *mappedValue, NSError *__autoreleasing *error) {
                    
                    return mappedValue && [mappedValue.id  isEqual: @2] && [mappedValue.name  isEqual: @"浙江大学"];
                }]];
                
                
                expect([mappingTest evaluate]).to.beTruthy();
            });
            
        });
    });

SpecEnd