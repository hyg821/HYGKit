//
//  HYGRootViewController.h
//  网络库
//
//  Created by 侯英格 on 16/6/24.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYGPersonalLibraryDefine.h"
#import "HYGhttpServiceDefine.h"
#import "HYGCategoryDefine.h"
#import "HYGPodsDefine.h"

typedef NS_ENUM(NSInteger, UIViewControllerCreateType) {
    FromCode,
    FromXib,
    FromStoryBoard
};

typedef NS_ENUM(NSInteger, UIViewControllerJumpType) {
    Present,
    Push
};

@interface HYGViewControllerInfo : NSObject

/**控制器创建的来源*/
@property(nonatomic,assign)UIViewControllerCreateType type;

/**
 * storyBoard的信息
 * key----- storyboardName  StoryBoard在工程中的名字
 * key----- identifier      在故事版中标记的vc的标识符
 */
@property(nonatomic,strong)NSMutableDictionary*storyBoardInfoDic;

/**xib的信息*/
@property(nonatomic,strong)NSMutableDictionary*xibInfoDic;

/**code代码创建的信息*/
@property(nonatomic,strong)NSMutableDictionary*codeInfoDic;

@end


@interface HYGRootViewController : UIViewController

/**网络请求任务数组*/
@property(nonatomic,strong)NSMutableArray*taskArray;

/**参数字典*/
@property(nonatomic,strong)NSDictionary*paramsDic;

/**控制器标示identifier*/
@property(nonatomic,copy)NSString*identifier;

/**是否需要隐藏NavigationBar 默认是不需要隐藏 ==YES*/
@property(nonatomic,assign)BOOL isNeedHideNavigationBar;

/**waitView*/
@property(nonatomic,strong)HYGWaitView*waitView;

/**统一的创建方法*/
+(instancetype)creatViewControllerWithInfo:(HYGViewControllerInfo*)viewControllerInfo andParams:(NSDictionary*)paramsDic;

@end


@interface UIViewController (TransitionCategory)

/**统一的跳转方法*/
+(void)transitionFromViewController:(UIViewController*)fromVC jumpToViewController:(UIViewController*)toVC with:(UIViewControllerJumpType)jumpType;

@end
