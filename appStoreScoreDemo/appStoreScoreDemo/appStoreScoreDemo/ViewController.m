//
//  ViewController.m
//  appStoreScoreDemo
//
//  Created by 卢见福 on 15/12/3.
//  Copyright © 2015年 arrfu. All rights reserved.
//

#import "ViewController.h"
#import "SLTurnIntoAppStoreScores.h"
#import <StoreKit/StoreKit.h>

@interface ViewController () <SKStoreProductViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/**
 * 直接跳转至AppStore
 */
- (IBAction)turnIntoAppStore {
    
    NSString *appID = @"1037988113";
    NSString *appUrl = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=";
   
    [SLTurnIntoAppStoreScores turnIntoAppStoreScoresUrl:appUrl appID:appID];
}

/**
 * 应用内部嵌入AppStore方式
 */
- (IBAction)insertAppStore {
    
    NSLog(@"insert app store,please wait ...");
    [self openAppWithIdentifier:@"1037988113"];

}

/**
 * 实例化一个SKStoreProductViewController类
 */
- (void)openAppWithIdentifier:(NSString *)appId {
    SKStoreProductViewController *storeProductVC = [[SKStoreProductViewController alloc] init];
    storeProductVC.delegate = self;
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:appId forKey:SKStoreProductParameterITunesItemIdentifier];
    [storeProductVC loadProductWithParameters:dict completionBlock:^(BOOL result, NSError *error) {
        if (result) {
            [self presentViewController:storeProductVC animated:YES completion:nil];
        }
    }];
}


#pragma mark - SKStoreProductViewControllerDelegate 嵌入应用商店
/**
 * 按取消按钮Cancel返回所调用代理方法,此处返回到ViewController控制器
 */
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)storeProductVC {
    [storeProductVC dismissViewControllerAnimated:YES completion:^{
        ViewController *moreVc = [[ViewController alloc]init];
        [self.navigationController pushViewController:moreVc animated:YES];
    }];
    
}


@end
