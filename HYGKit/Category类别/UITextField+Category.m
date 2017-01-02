//
//  UITextField+Category.m
//  SzfyTradingPlatform
//
//  Created by 侯英格 on 16/7/13.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "UITextField+Category.h"
#import <objc/runtime.h>

@implementation UITextField (Category)

static char *TextNumLimitKey = "TextNumLimitKey";

-(void)setTextNumLimit:(NSUInteger)textNumLimit{
    objc_setAssociatedObject(self, TextNumLimitKey, @(textNumLimit), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self removeTarget:self action:@selector(editingChange) forControlEvents:UIControlEventEditingChanged];
    [self addTarget:self action:@selector(editingChange) forControlEvents:UIControlEventEditingChanged];
    
}

-(NSUInteger)textNumLimit{
    return [objc_getAssociatedObject(self, TextNumLimitKey) unsignedIntegerValue];
}

-(void)editingChange{
    if (self.text.length > self.textNumLimit) {
        self.text = [self.text substringToIndex:self.textNumLimit];
    }
}

@end
