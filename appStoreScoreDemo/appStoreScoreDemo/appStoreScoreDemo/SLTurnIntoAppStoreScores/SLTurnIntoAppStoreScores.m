//
//  SLTurnIntoAppStoreScores.m
//  appStoreScoreDemo
//
//  Created by 卢见福 on 15/12/3.
//  Copyright © 2015年 arrfu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLTurnIntoAppStoreScores.h"

@implementation SLTurnIntoAppStoreScores


+(void)turnIntoAppStoreScoresUrl:(NSString *)url appID:(NSString *)ID{
    
    NSString *appUrl = [NSString stringWithFormat:@"%@%@",url,ID];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appUrl]];
}
@end
