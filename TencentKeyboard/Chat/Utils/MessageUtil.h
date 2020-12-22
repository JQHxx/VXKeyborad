//
//  MessageUtil.h
//  TencentKeyboard
//
//  Created by OFweek01 on 2020/12/22.
//  Copyright © 2020 lanlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageUtil : NSObject

// 把输入框的内容渲染到cell上显示
+ (NSAttributedString *)formatMessageString:(NSString *)text textFont:(UIFont *)textFont;

+ (CGSize)contentSize:(NSAttributedString *)attributedString textFont:(UIFont *)textFont width:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
