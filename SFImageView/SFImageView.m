//
//  SFImageView.m
//  SFImageView
//
//  Created by sbx_fc on 15/6/3.
//  Copyright (c) 2015年 RG. All rights reserved.
//

#import "SFImageView.h"
//#define UNFINISHED 1

@implementation SFImageView

-(id)initWithFrame:(CGRect)frame
{
    
    if(self == [super initWithFrame:frame]){
        
        NSUInteger frameCount = 7;

        //设置动画
        NSMutableArray* images = [[NSMutableArray alloc] initWithCapacity:frameCount];
        for (int i = 0; i < frameCount; i++){
            UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",(i + 1)]];
#ifdef UNFINISHED
            //在我的项目里,多次调用 SFImageView 在加载图片时会提示访问的非法指针。
            [images addObject:(__bridge id)(image.CGImage)];
#else
            CGImageRef cgImage = CGImageCreateCopy(image.CGImage);
            [images addObject:(__bridge id)(cgImage)];
            CGImageRelease(cgImage);
#endif
        }
        
        //设置帧动画发生时间,
        NSArray* keyTimes = [[NSArray alloc] initWithObjects:@(0.0f),@(1.0f/7.0f),@(2.0f/7.0f),@(3.0f/7.0f),@(4.0f/7.0f),@(5.0f/7.0f),@(6.0f/7.0f),@(1), nil];
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
        animation.calculationMode = kCAAnimationDiscrete;
        animation.keyTimes = keyTimes;
        animation.values = images;
        animation.duration = 1;
        animation.repeatCount = HUGE_VAL;
        [self.layer addAnimation:animation forKey:@"customAnimation"];
        
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
