//
//  NOSRecruitmentModelViewTest.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/23.
//  Copyright © 2015年 HithinkSoft. All rights reserved.
//


#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <CoreData/CoreData.h>
#import <RestKit/Testing.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
#import "NOSRecruitment+CoreDataProperties.h"
#import "NOSCollege+CoreDataProperties.h"
#import "NOSRecruitmentModelView.h"
#import "NOSErrorMessage.h"
#import "NOSModelContants.h"


SpecBegin(NOSRecruitmentModelView)

    describe(@"NOSRecruitmentModelView", ^{
        
        RKObjectManager *objectManager = [RKTestFactory objectManager];
        objectManager.managedObjectStore = [RKTestFactory managedObjectStore];
        
        [NOSRecruitment registWithObjectManager:objectManager];
        [NOSErrorMessage registWithObjectManager:objectManager];
        
        // important: so that query in method could use this RKObjectManager to execute
        [RKObjectManager setSharedManager:objectManager];
        
        context(@"when method findAll is invoked and server responses successfully without any error", ^{
            
            beforeAll(^{
                [OHHTTPStubs removeAllStubs];
            });
            
            it(@"should can be fetched", ^{
                
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [request.URL.path isEqualToString:@"/recruitments"];
                } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
                    NSString* fixture = OHPathForFile(@"recruitments.json", self.class);
                    return [OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                            statusCode:200 headers:@{@"Content-Type":@"application/json"}];
                }];
                
                NSMutableArray *results = [NSMutableArray array];
           
                [NOSRecruitmentModelView findAll:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                    
                    NSManagedObjectContext *context = objectManager.managedObjectStore.mainQueueManagedObjectContext;
                    
                    
                    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NOSRecruitmentEntityName ];
                    
                    NSError *error = nil;
                    [results addObjectsFromArray:[context executeFetchRequest:request error:&error]];
                    
                } failure:nil];
                
                // This might be not reliabe
                expect(results).after(3).haveLengthOf(3);
            });
            
            afterEach(^{
                [OHHTTPStubs removeAllStubs];
            });
            
        });
        

        context(@"when method findAll is invoked and server responses with error code 422", ^{
            
            it(@"should get an error", ^{
                
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [request.URL.path isEqualToString:@"/recruitments"];
                } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
                    NSString* fixture = OHPathForFile(@"recruitment-422.json", self.class);
                    return [OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                            statusCode:422 headers:@{@"Content-Type":@"application/json"}];
                }];
                
                NSMutableArray *results = [NSMutableArray array];
    
                [NOSRecruitmentModelView findAll:nil failure:^(RKObjectRequestOperation *operation, NSError *error) {
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

SpecEnd