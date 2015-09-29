//
//  NOSConfigTest.m
//  NoodlesStu-iOS
//
//  Created by Snowblink on 15/9/23.
//  Copyright (c) 2015年 HithinkSoft. All rights reserved.
//

#import "NOSConfig.h"
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

SpecBegin(NOSConfig)

    describe(@"NOSConfig", ^{
        
        context(@"when is initialized", ^{
            NOSConfig *config = [[NOSConfig alloc] init];

            it(@"should get APIBaseURL value", ^{
                expect(config.APIBaseURL).to.beginWith(@"http");
            });
        });
    });

SpecEnd