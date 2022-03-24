//
//  UIButton+LHBlock.h
//  QiLin
//
//  Created by lihao on 2019/1/10.
//  Copyright © 2019年 lihao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LHBlock)

@property(nonatomic, copy) void(^block)(UIButton *);

- (void)tapBlock:(void(^)(UIButton *btn))block;

@end

NS_ASSUME_NONNULL_END
