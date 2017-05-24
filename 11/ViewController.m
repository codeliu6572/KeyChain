//
//  ViewController.m
//  11
//
//  Created by shihanbainian on 2017/5/16.
//  Copyright © 2017年 shihanbainian. All rights reserved.
//

#import "ViewController.h"
#import "LHUUIDManager.h"
@interface ViewController ()
{
    UILabel *uuidLabel;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *getUUID = [UIButton buttonWithType:UIButtonTypeSystem];
    getUUID.frame = CGRectMake(10, 100, self.view.bounds.size.width - 20, 50);
    [getUUID setTitle:@"获取UUID" forState:UIControlStateNormal];
    getUUID.backgroundColor = [UIColor orangeColor];
    [getUUID addTarget:self action:@selector(getAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getUUID];
    
    
    UIButton *readUUID = [UIButton buttonWithType:UIButtonTypeSystem];
    readUUID.frame = CGRectMake(10, 200, self.view.bounds.size.width - 20, 50);
    [readUUID setTitle:@"读取UUID" forState:UIControlStateNormal];
    readUUID.backgroundColor = [UIColor orangeColor];
    [readUUID addTarget:self action:@selector(readAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:readUUID];
    
    UIButton *delUUID = [UIButton buttonWithType:UIButtonTypeSystem];
    delUUID.frame = CGRectMake(10, 300, self.view.bounds.size.width - 20, 50);
    [delUUID setTitle:@"删除UUID" forState:UIControlStateNormal];
    delUUID.backgroundColor = [UIColor orangeColor];
    [delUUID addTarget:self action:@selector(delAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delUUID];
    
    uuidLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 400, self.view.bounds.size.width - 20, 50)];
    uuidLabel.text = @"UUID";
    uuidLabel.backgroundColor = [UIColor orangeColor];
    uuidLabel.font = [UIFont systemFontOfSize:13];
    uuidLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:uuidLabel];
}

- (void)getAction
{
    [LHUUIDManager saveUUID];
}

- (void)readAction
{
    uuidLabel.text = [NSString stringWithFormat:@"%@",[LHUUIDManager readUUID]];
}

- (void)delAction
{
    [LHUUIDManager deleteUUID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
