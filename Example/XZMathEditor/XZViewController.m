//
//  XZViewController.m
//  XZMathEditor
//
//  Created by xiaoMing0109 on 03/10/2020.
//  Copyright (c) 2020 xiaoMing0109. All rights reserved.
//

#import "XZViewController.h"
#import "MTEditableMathLabel.h"
#import "MTMathKeyboardRootView.h"

@interface XZViewController () <MTEditableMathLabelDelegate>

@property (weak, nonatomic) IBOutlet MTEditableMathLabel *mathLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelHeight;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

@end

@implementation XZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mathLabel.layer.borderColor = [UIColor blackColor].CGColor;
    self.mathLabel.layer.borderWidth = 2;
    self.mathLabel.layer.cornerRadius = 5;
    self.mathLabel.keyboard = [MTMathKeyboardRootView sharedInstance];
    self.mathLabel.delegate = self;
    [self.mathLabel enableTap:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark MTEditableMathLabelDelegate

- (void)textModified:(MTEditableMathLabel *)label
{
    CGFloat minHeight = 64;
    // Increase the height of the label as the height increases.
    CGSize mathSize = label.mathDisplaySize;
    if (mathSize.height > self.labelHeight.constant - 10) {
        [label layoutIfNeeded];
        // animate
        [UIView animateWithDuration:0.5 animations:^{
            self.labelHeight.constant = mathSize.height + 10;
            [label layoutIfNeeded];
        }];
    } else if (mathSize.height < self.labelHeight.constant - 20) {
        CGFloat newHeight = MAX(mathSize.height + 10, minHeight);
        if (newHeight < self.labelHeight.constant) {
            [label layoutIfNeeded];
            // animate
            [UIView animateWithDuration:0.5 animations:^{
                self.labelHeight.constant = newHeight;
                [label layoutIfNeeded];
            }];
        }
    }

    // Shrink the font as the label gets longer.
    if (mathSize.width > label.frame.size.width - 10) {
        label.fontSize = label.fontSize * 0.9;

    } else if (mathSize.width < label.frame.size.width - 40) {
        CGFloat fontSize = MIN(label.fontSize * 1.1, 30);
        if (fontSize > label.fontSize) {
            label.fontSize = fontSize;
        }
    }
}

- (void)didBeginEditing:(MTEditableMathLabel *)label
{
    self.placeholderLabel.hidden = YES;
}

@end
