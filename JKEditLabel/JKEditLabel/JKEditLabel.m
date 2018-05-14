//
//  JKEditLabel.m
//  UIResponder
//
//  Created by admin on 2018/5/14.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "JKEditLabel.h"

@interface JKEditLabel ()
    
@end

@implementation JKEditLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self attachTapHandle];
    }
    return self;
}
    
- (void)attachTapHandle {
    self.userInteractionEnabled = true;
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:longPress];
}
    
- (void)handleTap:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
        UIMenuItem * item = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copy:)];
        UIMenuItem * item1 = [[UIMenuItem alloc] initWithTitle:@"自己功能" action:@selector(test:)];
        [[UIMenuController sharedMenuController] setMenuItems:@[item, item1]];
        [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    }
}

- (BOOL)canBecomeFirstResponder {
    return true;
}
    
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
//    UIResponder
    if(action == @selector(paste:)      ||
       action == @selector(copy:)       ||
       action == @selector(cut:)        ||
       action == @selector(delete:)     ||
       action == @selector(test:)) {
        return YES;
    }
    return NO;
}

//- (void)cut:(nullable id)sender NS_AVAILABLE_IOS(3_0);//剪切
//- (void)copy:(nullable id)sender NS_AVAILABLE_IOS(3_0);//复制
//- (void)paste:(nullable id)sender NS_AVAILABLE_IOS(3_0);//粘贴
//- (void)select:(nullable id)sender NS_AVAILABLE_IOS(3_0);//选择
//- (void)selectAll:(nullable id)sender NS_AVAILABLE_IOS(3_0);//全选
//- (void)delete:(nullable id)sender NS_AVAILABLE_IOS(3_2);//删除
//- (void)makeTextWritingDirectionLeftToRight:(nullable id)sender NS_AVAILABLE_IOS(5_0);//
//- (void)makeTextWritingDirectionRightToLeft:(nullable id)sender NS_AVAILABLE_IOS(5_0);//
//- (void)toggleBoldface:(nullable id)sender NS_AVAILABLE_IOS(6_0);//粗体
//- (void)toggleItalics:(nullable id)sender NS_AVAILABLE_IOS(6_0);//斜体
//- (void)toggleUnderline:(nullable id)sender NS_AVAILABLE_IOS(6_0);//下划线
//
//- (void)increaseSize:(nullable id)sender NS_AVAILABLE_IOS(7_0);//字号增大
//- (void)decreaseSize:(nullable id)sender NS_AVAILABLE_IOS(7_0);//字号减小
#pragma mark - UIResponderStandardEditActions
- (void)copy:(id)sender {
    UIPasteboard * paste = [UIPasteboard generalPasteboard];
    paste.string = self.text;
}
    
- (void)paste:(id)sender {
    UIPasteboard * paste = [UIPasteboard generalPasteboard];
    self.text = paste.string;
}
    
- (void)delete:(id)sender {
    self.text = @"";
}

- (void)cut:(id)sender {
    UIPasteboard * paste = [UIPasteboard generalPasteboard];
    paste.string = self.text;
    self.text = @"";
}
    
- (void)test:(id)sender {
    self.text = @"自己定义的内容";
}
    
@end
