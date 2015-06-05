//
//  SFImageView.m
//  SFImageView
//
//  Created by sbx_fc on 15/6/3.
//  Copyright (c) 2015年 RG. All rights reserved.
//

#import "SFImageView.h"

@implementation SFImageView

-(id)initWithFrame:(CGRect)frame
{
    
    if(self == [super initWithFrame:frame]){
        
        //总帧数
        NSUInteger FRAME_COUNT = 7;

        //设置每帧动画图片
        NSMutableArray* images = [[NSMutableArray alloc] initWithCapacity:FRAME_COUNT];
        UIImage* image;
        for (int i = 0; i < FRAME_COUNT; i++){
            image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",(i + 1)]];
            [images addObject:(__weak id)(image.CGImage)];
        }
        
        //每帧动画发生在总时长durationsh上的位置,
        //第一帧时间为0,参见 kCAAnimationDiscrete 属性介绍.
        NSArray* keyTimes = [[NSArray alloc] initWithObjects:@0,@(1.0f/7.0f),@(2.0f/7.0f),@(3.0f/7.0f),@(4.0f/7.0f),@(5.0f/7.0f),@(6.0f/7.0f),@1, nil];
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
        animation.calculationMode = kCAAnimationDiscrete;
        animation.keyTimes = keyTimes;
        animation.values = images;
        animation.duration = 7;     //总时长
        animation.repeatCount = HUGE_VAL;
        [self.layer addAnimation:animation forKey:nil];
        
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
