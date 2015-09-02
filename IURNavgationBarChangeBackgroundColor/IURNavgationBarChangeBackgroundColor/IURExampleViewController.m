//
//  IURExampleViewController.m
//  IURNavgationBarChangeBackgroundColor
//
//  Created by iurw on 15/9/2.
//  Copyright (c) 2015年 iurw. All rights reserved.
//


#import "IURExampleViewController.h"
#import "UINavigationBar+ChangeNavigationBarBackgroundColor.h"
#import "IURDetailViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define NAVBAR_CHANGE_POINT 50

@interface IURExampleViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *  _testingTableView;
    UIImageView *_tableHeaderViewOfImage;
}
@end

@implementation IURExampleViewController

- (void)viewWillAppear:(BOOL)animated
{
    
    [self scrollViewDidScroll:_testingTableView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"Title";
    
    _testingTableView.delegate = self;
    _testingTableView.dataSource = self;
    
    /**
     * 自动设置相应的内边距，可以让tableview占据整个试图，不会让导航覆盖
     */
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(headerRightButtonAction)];
    
    /**
     * 页眉
     */
    _tableHeaderViewOfImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 260)];
    _tableHeaderViewOfImage.image = [UIImage imageNamed:@"bg.jpg"];
    
}

- (void)headerRightButtonAction
{
    
    IURDetailViewController *detail = [[IURDetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  260;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return _tableHeaderViewOfImage;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 19;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /**
     * define没有数据类型（预处理命令与编译器无关），const有数据类型
     * const：全局常量，只读（有作用域）
     * static：静态全局变量，声明后存在内存中特殊的位置，下次使用时，从该内从中读去上次的值（在静态区存储）
     * NSString *const ID = @"cell" 和 const NSString *ID = @"cell" 区别：
     * 前者可以改变指针指向的内容，不能改变指针的指向。后者可以改变指针的指向，不能改变指针指向的内容
     */
    
    NSString *const ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = @"text";
    return cell;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    UIColor *color = [UIColor colorWithRed:0.0/255.0 green:175.0/255.0 blue:240.0/255.0 alpha:1];
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1,1 - ((NAVBAR_CHANGE_POINT + 64 -offsetY) / 64));
        [self.navigationController.navigationBar am_setBacgroundColor:[color colorWithAlphaComponent:alpha]];
    }else{
        [self.navigationController.navigationBar am_setBacgroundColor:[color colorWithAlphaComponent:0]];
    }
    
}

@end
