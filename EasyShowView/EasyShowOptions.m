//
//  EasyShowOptions.m
//  EasyShowViewDemo
//
//  Created by Mr_Chen on 2017/11/24.
//  Copyright © 2017年 chenliangloveyou. All rights reserved.
//

#import "EasyShowOptions.h"

const CGFloat EasyDrawImageWH  = 30 ;   //显示图片的宽高
const CGFloat EasyDrawImageEdge = 15 ;  //显示图片的边距
const CGFloat EasyTextShowEdge = 40 ;   //显示纯文字时，当设置top和bottom的时候，距离屏幕上下的距离
const CGFloat EasyShowViewMinWidth = 50 ;//视图最小的宽度

const CGFloat EasyShowLodingMaxWidth = 200 ;    //显示文字的最大宽度（高度已限制死）

const CGFloat EasyShowLodingImageEdge = 10 ;    //加载框图片的边距
const CGFloat EasyShowLodingImageWH = 30 ;      //加载框图片的大小
const CGFloat EasyShowLodingImageMaxWH = 60 ;   //加载框图片的最大宽度


NSString *const EasyShowViewDidlDismissNotification = @"EasyShowViewDidlDismissNotification" ; //当EasyShowView消失的时候会发送此通知。


@interface EasyShowOptions()
@end

@implementation EasyShowOptions

@synthesize lodingPlayImagesArray = _lodingPlayImagesArray ;

static EasyShowOptions *_showInstance;
+ (id)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _showInstance = [super allocWithZone:zone];
    });
    return _showInstance;
}
+ (instancetype)sharedEasyShowOptions{
    if (nil == _showInstance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _showInstance = [[[self class] alloc] init];
        });
    }
    return _showInstance;
}
- (id)copyWithZone:(NSZone *)zone{
    return _showInstance;
}
- (id)mutableCopyWithZone:(NSZone *)zone
{
    return _showInstance;
}


- (instancetype)init
{
    if (self = [super init]) {
        _textFount = [UIFont systemFontOfSize:13];
        _backGroundColor = [[UIColor blackColor]colorWithAlphaComponent:1];
        _textColor = [UIColor whiteColor];
        
        _showShadow = YES ;
        _shadowColor = [UIColor cyanColor];
        
        _maxWidthScale = 0.8 ;
        _maxShowTime = 6.0f ;
        _superViewReceiveEvent = NO ;
        
        _textStatusType = ShowTextStatusTypeMidden  ;
        
        _showStartAnimation = YES ;
        _showEndAnimation = YES ;
        _showAnimationTime = 0.3 ;
        
        
        
        _lodingShowType = LodingShowTypeTurnAround ;
        _lodingAnimationType = lodingAnimationTypeBounce ;
        _lodingTintColor = [UIColor blackColor];
        _lodingBackgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.05];
        _lodingSuperViewReceiveEvent = YES ;
        _lodingShowOnWindow = NO ;
        _lodingCycleCornerWidth = 5 ;
        
        // [UIColor colorWithRed:82/255.0 green:90/255.0 blue:251.0/255.0 alpha:1] ;
        _alertTitleColor = [UIColor blackColor];
        _alertMessageColor = [UIColor darkGrayColor];
        _alertTintColor = [UIColor clearColor];
        _alertTowItemHorizontal = YES ;
        _alertBgViewTapRemove = NO ;
    }
    return self ;
}
- (void)setlodingPlayImagesArray:(NSArray *)lodingPlayImagesArray
{
    _lodingPlayImagesArray = lodingPlayImagesArray ;
}
- (NSArray *)lodingPlayImagesArray
{
    NSAssert(_lodingPlayImagesArray, @"you should set image array use to animation!");
    return _lodingPlayImagesArray  ;
}

@end
