//
//  _YHZombie_.m
//  ZombinDemo
//
//  Created by 珲少 on 2021/12/3.
//

#import "_YHZombie_.h"

@implementation _YHZombie_

// 调用这个对象对的所有方法都hook住进行LOG
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%p-[%@ %@]:%@",self ,[NSStringFromClass(self.class) componentsSeparatedByString:@"_YHZombie_"].lastObject, NSStringFromSelector(aSelector), @"向已经dealloc的对象发送了消息");
    // 结束当前线程
    abort();
}

@end
