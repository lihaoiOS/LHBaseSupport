//
//  UIButton+LHBlock.m
//  QiLin
//
//  Created by lihao on 2019/1/10.
//  Copyright © 2019年 lihao. All rights reserved.
//

#import "UIButton+LHBlock.h"
#import <objc/runtime.h>

@implementation UIButton (LHBlock)

- (void)setBlock:(void(^)(UIButton *))block
{
    objc_setAssociatedObject(self,@selector(block), block,OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(click:)forControlEvents:UIControlEventTouchUpInside];
}

- (void(^)(UIButton *))block
{
    return objc_getAssociatedObject(self,@selector(block));
}

- (void)tapBlock:(void(^)(UIButton *))block
{
    self.block = block;
    
    [self addTarget:self action:@selector(click:)forControlEvents:UIControlEventTouchUpInside];
}

- (void)click:(UIButton *)btn
{
    if(self.block) {
        
        self.block(btn);
    }
}

@end
