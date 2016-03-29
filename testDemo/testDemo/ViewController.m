//
//  ViewController.m
//  testDemo
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "PopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)popView {
    
    [PopView setButtonWithBlock:^(id<PoPDetialViewDelegate> button) {
        
        [button setButtonTitle:@"跳转" BackgroundColor:[UIColor blackColor]];
        
    } pushViewController:^{
        ViewController2 *vc2 = [[ViewController2 alloc]init];
        [self.navigationController pushViewController:vc2 animated:YES];
        
    }];
    
    
}



@end
