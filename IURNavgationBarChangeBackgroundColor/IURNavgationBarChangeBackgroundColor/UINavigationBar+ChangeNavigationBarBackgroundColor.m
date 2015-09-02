//
//  UINavigationBar+ChangeNavigationBarBackgroundColor.m
//  IURNavgationBarChangeBackgroundColor
//
//  Created by iurw on 15/9/2.
//  Copyright (c) 2015年 iurw. All rights reserved.
//

#import "UINavigationBar+ChangeNavigationBarBackgroundColor.h"
#import <objc/runtime.h>

@implementation UINavigationBar (ChangeNavigationBarBackgroundColor)

static char overlayKey;

- (UIView *)overlay{
    
    return objc_getAssociatedObject(self, &overlayKey);
    
}

- (void)setOverlay:(UIView *)overlay{
    
    objc_setAssociatedObject(self, &overlayKey,overlay,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)am_setBacgroundColor:(UIColor *)backgroundColor{
    
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        //insert an overlay into the view hierarchy
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height + 20)];
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
    
}



@end
