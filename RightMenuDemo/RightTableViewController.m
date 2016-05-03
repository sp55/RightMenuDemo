//
//  RightTableViewController.m
//  RightMenuDemo
//
//  Created by admin on 16/5/3.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "RightTableViewController.h"

@interface RightTableViewController ()
@property (nonatomic, strong) NSMutableArray *addArray;

@end

@implementation RightTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.scrollEnabled = NO;
    self.addArray = [[NSMutableArray alloc] initWithObjects:@"扫一扫",@"搜一搜", @"创建讨论组",@"发送到电脑", @"面对面快传",@"收钱", nil];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.addArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.addArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger number = indexPath.row;
    NSLog(@"===%@",self.addArray[number]);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//重写preferredContentSize，返回popover的大小
- (CGSize)preferredContentSize {
    if (self.presentingViewController && self.tableView != nil) {
        CGSize tempSize = self.presentingViewController.view.bounds.size;
        tempSize.width = 150;
        CGSize size = [self.tableView sizeThatFits:tempSize];  //sizeThatFits返回的是最合适的尺寸，但不会改变控件的大小
        return size;
    }else {
        return [super preferredContentSize];
    }
}

@end
