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
#import <OHHTTPStubs/OHHTTPStubs.h>
#import "NOSErrorMessage.h"
#import "NOSModelContants.h"

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
            
            context(@"when findAllSignal is invoked and server responses successfully without any error", ^{
                
                beforeAll(^{
                    [OHHTTPStubs removeAllStubs];
                });
                
                RKObjectManager *objectManager = [RKTestFactory objectManager];
                objectManager.managedObjectStore = [RKTestFactory managedObjectStore];
                
                [NOSRecruitment registWithObjectManager:objectManager];
                [NOSErrorMessage registWithObjectManager:objectManager];
                
                // important: so that query in method could use this RKObjectManager to execute
                [RKObjectManager setSharedManager:objectManager];
                
                it(@"should can be fetched", ^{
                    
                    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                        return [request.URL.path isEqualToString:@"/recruitments"];
                    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
                        NSString* fixture = OHPathForFile(@"recruitments.json", self.class);
                        return [OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                                statusCode:200 headers:@{@"Content-Type":@"application/json"}];
                    }];
                    
                    NSMutableArray *results = [NSMutableArray array];
                    
                    [[NOSRecruitment findAllSignal] subscribeNext:^(id x) {
                        NSManagedObjectContext *context = objectManager.managedObjectStore.mainQueueManagedObjectContext;
                        
                        
                        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NOSRecruitmentEntityName ];
                        
                        NSError *error = nil;
                        [results addObjectsFromArray:[context executeFetchRequest:request error:&error]];
                    }];
                    
                    // This might be not reliabe
                    expect(results).after(3).haveLengthOf(3);
                });
                
                afterEach(^{
                    [OHHTTPStubs removeAllStubs];
                });
            });
            
            context(@"when findAllSignal is invoked and server responses with error code 422", ^{
                
                it(@"should get an error", ^{
                    
                    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                        return [request.URL.path isEqualToString:@"/recruitments"];
                    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
                        NSString* fixture = OHPathForFile(@"recruitment-422.json", self.class);
                        return [OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                                statusCode:422 headers:@{@"Content-Type":@"application/json"}];
                    }];
                    
                    NSMutableArray *results = [NSMutableArray array];
                    
                    [[NOSRecruitment findAllSignal] subscribeError:^(NSError *error) {
                        [results addObject:[[error.userInfo objectForKey:RKObjectMapperErrorObjectsKey] firstObject]];
                    }];

                    expect(results.firstObject).after(3).notTo.beNil();
                    expect([(NOSErrorMessage *)[results firstObject] status]).after(3).equal(@422);
                    expect([(NOSErrorMessage *)[results firstObject] error]).after(3).equal(@"Internal Server Error");
                    expect([(NOSErrorMessage *)[results firstObject] exception]).after(3).equal(@"org.springframework.beans.NotReadablePropertyException");
                    expect([(NOSErrorMessage *)[results firstObject] message]).after(3).equal(@"Invalid property end");
                    expect([(NOSErrorMessage *)[results firstObject] path]).after(3).equal(@"/recruitment_info");
                    
                });
                
                afterEach(^{
                    [OHHTTPStubs removeAllStubs];
                });
            });

            
        });
    });

SpecEnd