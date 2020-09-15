//
//  TKImageLayout.h
//  AllocationsDemo
//
//  Created by hello on 2020/9/15.
//  Copyright © 2020 TK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ImageLayoutDelegate<NSObject>

- (CGSize)imageSizeForItemAtIndex:(NSIndexPath *)indexPath;

@end

@interface TKImageLayout : UICollectionViewLayout

@property (weak, nonatomic) id<ImageLayoutDelegate> delegate;

@property (assign, nonatomic) CGFloat itemWidth;

@end

NS_ASSUME_NONNULL_END
