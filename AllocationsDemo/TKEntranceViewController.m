//
//  TKEntranceViewController.m
//  AllocationsDemo
//
//  Created by hello on 2020/9/15.
//  Copyright © 2020 TK. All rights reserved.
//

#import "TKEntranceViewController.h"
#import "TKFlowImageViewController.h"

@interface TKEntranceViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation TKEntranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationController.title = @"分析静态内存分配";
    
    UIButton *analyseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    analyseBtn.frame = CGRectMake(100.f, 200.f, 200.f, 50.f);
    analyseBtn.backgroundColor = UIColor.blackColor;
    [analyseBtn setTitle:@"Test" forState:UIControlStateNormal];
    [analyseBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [analyseBtn addTarget:self action:@selector(analyseBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    analyseBtn.layer.cornerRadius = 25.f;
    analyseBtn.layer.masksToBounds = YES;
    analyseBtn.layer.borderColor = UIColor.whiteColor.CGColor;
    analyseBtn.layer.borderWidth = 0.5f;
    [self.view addSubview:analyseBtn];
}

- (void)analyseBtnAction:(UIButton *)sender {
    TKFlowImageViewController *mainVc = [TKFlowImageViewController new];
    [self.navigationController pushViewController:mainVc animated:YES];
}

@end
