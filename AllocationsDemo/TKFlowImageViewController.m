//
//  TKFlowImageViewController.m
//  AllocationsDemo
//
//  Created by hello on 2020/9/15.
//  Copyright © 2020 TK. All rights reserved.
//

#import "TKFlowImageViewController.h"
#import <CoreImage/CoreImage.h>
#import "TKImageLayout.h"
#import "TKFlowImageCell.h"
#import "TKDetailViewController.h"

@interface TKFlowImageViewController () <UICollectionViewDataSource,UICollectionViewDelegate,ImageLayoutDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) NSArray<UIImage *> *images;

@property (strong, nonatomic) UIActivityIndicatorView *indicator;

@end

@implementation TKFlowImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAllImages];
    [self.collectionView registerClass:[TKFlowImageCell class] forCellWithReuseIdentifier:NSStringFromClass(TKFlowImageCell.class)];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.indicator];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.indicator.center = self.view.center;
    self.collectionView.frame = self.view.bounds;
}

#pragma mark - CollectionView Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TKFlowImageCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(TKFlowImageCell.class) forIndexPath:indexPath];
    cell.imageView.image = [self.images objectAtIndex:indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImage * image = [self.images objectAtIndex:indexPath.item];
    TKDetailViewController * dvc = [[TKDetailViewController alloc] initWithImage:image];
    [self.navigationController pushViewController:dvc animated:YES];
}

#pragma mark - ImageLayout Delegate

- (CGSize)imageSizeForItemAtIndex:(NSIndexPath *)indexPath{
    return [self.images objectAtIndex:indexPath.item].size;
}

#pragma mark - Util

- (void)loadAllImages{
    [self.indicator startAnimating];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray * images = [NSMutableArray new];
        for (long i = 1; i <= 20; i++) {
            NSString * imageName = [NSString stringWithFormat:@"image_%ld",i % 20 + 1];
            NSString * imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
            UIImage * image = [UIImage imageWithContentsOfFile:imagePath];
            [images addObject:[self filterdImage:image]];
        }
        self.images = [images copy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.indicator stopAnimating];
            [self.collectionView reloadData];
        });
    });
}

- (UIImage *)filterdImage:(UIImage *)originalImage{
    CIImage *inputImage = [CIImage imageWithCGImage:originalImage.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIColorMonochrome"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[CIColor colorWithRed:0.9 green:0.88 blue:0.12 alpha:1] forKey:kCIInputColorKey];
    [filter setValue:@0.5 forKey:kCIInputIntensityKey];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *outputImage = filter.outputImage;
    CGImageRef image = [context createCGImage:outputImage fromRect:outputImage.extent];
    UIImage * filterImage =  [UIImage imageWithCGImage:image];
    
#warning 测试时，需要注释该行代码
    CGImageRelease(image);
    return filterImage;
}

- (UIActivityIndicatorView *)indicator {
    if (!_indicator) {
        _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicator.hidesWhenStopped = YES;
    }
    return _indicator;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        TKImageLayout * layout = [[TKImageLayout alloc] init];
        layout.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

@end
