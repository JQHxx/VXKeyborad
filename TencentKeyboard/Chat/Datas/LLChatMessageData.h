//
//  LLChatMessageData.h
//  TencentKeyboard
//
//  Created by OFweek01 on 2020/12/22.
//  Copyright © 2020 lanlan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLChatMessageData : NSObject

@property (strong) NSString *reuseId;
- (CGFloat)heightOfWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
