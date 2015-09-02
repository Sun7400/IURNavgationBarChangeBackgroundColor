//
//  IURDetailViewController.m
//  IURNavgationBarChangeBackgroundColor
//
//  Created by iurw on 15/9/2.
//  Copyright (c) 2015年 iurw. All rights reserved.
//

#import "IURDetailViewController.h"
#import "UINavigationBar+ChangeNavigationBarBackgroundColor.h"

@interface IURDetailViewController ()

@end

@implementation IURDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *color = [UIColor colorWithRed:0.0/255.0 green:175.0/255.0 blue:240.0/255.0 alpha:1];
    [self.navigationController.navigationBar am_setBacgroundColor:[color colorWithAlphaComponent:1]];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(headerBackButtonAction)];
    
}

-(void)headerBackButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
