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

- (void)awakeFromNib {
    [super awakeFromNib];
    [self attachTapHandle];
}

// 添加长按手势
- (void)attachTapHandle {
    self.userInteractionEnabled = true;
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:longPress];
}

//  可以在此方法中改变菜单文字或者设置自己的方法
- (void)handleTap:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
//        [UIMenuController sharedMenuController].arrowDirection = UIMenuControllerArrowRight;
        UIMenuItem * item = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copy:)];
        UIMenuItem * item1 = [[UIMenuItem alloc] initWithTitle:@"改变背景色" action:@selector(changeBackgroundColor:)];
        [[UIMenuController sharedMenuController] setMenuItems:@[item, item1]];
        [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
        [[UIMenuController sharedMenuController] update];
    }
}

// 不设置这个方法,会导致无法调出menu菜单
- (BOOL)canBecomeFirstResponder {
    return true;
}

// 再此方法中判断允许的方法,否则菜单项不弹出
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
//    UIResponder
    if(action == @selector(paste:)      ||
       action == @selector(copy:)       ||
       action == @selector(cut:)        ||
       action == @selector(delete:)     ||
       action == @selector(changeBackgroundColor:)) {
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
//- (void)makeTextWritingDirectionLeftToRight:(nullable id)sender NS_AVAILABLE_IOS(5_0);//左对齐
//- (void)makeTextWritingDirectionRightToLeft:(nullable id)sender NS_AVAILABLE_IOS(5_0);//右对齐
//- (void)toggleBoldface:(nullable id)sender NS_AVAILABLE_IOS(6_0);//粗体
//- (void)toggleItalics:(nullable id)sender NS_AVAILABLE_IOS(6_0);//斜体
//- (void)toggleUnderline:(nullable id)sender NS_AVAILABLE_IOS(6_0);//下划线
//
//- (void)increaseSize:(nullable id)sender NS_AVAILABLE_IOS(7_0);//字号增大
//- (void)decreaseSize:(nullable id)sender NS_AVAILABLE_IOS(7_0);//字号减小
#pragma mark - UIResponderStandardEditActions
// 实现方法，完成功能
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
    
- (void)changeBackgroundColor:(id)sender {
    self.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 green:(arc4random() % 256) / 255.0 blue:(arc4random() % 256) / 255.0 alpha:1];
}
    
@end
