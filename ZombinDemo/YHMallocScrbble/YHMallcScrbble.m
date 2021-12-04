//
//  YHMallcScrbble.m
//  ZombinDemo
//
//  Created by 珲少 on 2021/12/4.
//

#import "YHMallcScrbble.h"
#import "fishhook.h"
#import "malloc/malloc.h"


void * (*orig_malloc)(size_t __size);
void (*orig_free)(void * p);


void *_YHMalloc_(size_t __size) {
    void *p = orig_malloc(__size);
    memset(p, 0xAA, __size);
    return p;
}

void _YHFree_(void * p) {
    size_t size = malloc_size(p);
    memset(p, 0x55, size);
//    orig_free(p);
}



@implementation YHMallcScrbble

+ (void)load {
    rebind_symbols((struct rebinding[2]){{"malloc", _YHMalloc_, (void *)&orig_malloc}, {"free", _YHFree_, (void *)&orig_free}}, 2);
}

@end
