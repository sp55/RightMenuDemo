//
//  ViewController.m
//  RightMenuDemo
//
//  Created by admin on 16/5/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//
//http://www.jianshu.com/p/6f5153b7ad35


#import "ViewController.h"
#import "RightTableViewController.h"
@interface ViewController ()<UIPopoverPresentationControllerDelegate>
@property(strong,nonatomic)RightTableViewController *itemPopVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 右边
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarAction)];
}
#pragma mark -- 菜单
// 菜单  点击按钮调用的方法
- (void)rightBarAction {
    
    self.itemPopVC = [[RightTableViewController alloc] init];
    self.itemPopVC.modalPresentationStyle = UIModalPresentationPopover;
    self.itemPopVC.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
    //箭头方向
    self.itemPopVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    //代理
    self.itemPopVC.popoverPresentationController.delegate = self;
    //present
    [self presentViewController:self.itemPopVC animated:YES completion:nil];
}
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    NSLog(@"%@",controller);
    return  UIModalPresentationNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
