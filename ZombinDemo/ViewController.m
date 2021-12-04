//
//  ViewController.m
//  ZombinDemo
//
//  Created by 珲少 on 2021/12/3.
//

#import "ViewController.h"
#import "MyObject.h"

typedef struct {
    NSString *name;
} MyStruct;

@interface ViewController ()

@property (nonatomic, unsafe_unretained)MyObject *object;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
//    MyObject *object = [[MyObject alloc] init];
//    self.object = object;
//    self.object.name = @"HelloWorld";
//    void *p = (__bridge void *)(self.object);
//    NSLog(@"%p,%@",self.object,self.object.name);
//    NSLog(@"%p,%@",p, [(__bridge MyObject *)p name]);
    
    
    
    
    // 分配内存
    MyStruct *p;
    p = malloc(sizeof(MyStruct));
    printf("%p\n", p);
    // 此时内存中的数据不可控 可能是之前未擦除的
    printf("%x\n", *((int *)p));
    // 使用可能会出现野指针问题
//    NSLog(@"%@", p->name);
    // 进行内存数据的初始化
    p->name = @"HelloWorld";
    // 回收内存
    free(p);
    printf("%x\n", *((int *)p));
    // 此时内存中的数据不可控
    NSLog(@"%@", p->name);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%p",self->_object);
//    NSLog(@"%@",self.object.name);
  
}

@end
