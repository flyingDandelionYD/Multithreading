//
//  ViewController_01.m
//  Multithreading
//


#import "ViewController_1.h"

@interface ViewController_1 ()

@end

@implementation ViewController_1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这句代码的本质是往Runloop中添加定时器  如果在主线程，runloop自动开启好了的
    [self performSelector:@selector(test1) withObject:nil afterDelay:.0];//afterDelay-->异步执行的 主队列
    //主队列异步执行时，会先执行完主线程上的代码，然后在主线程上顺序执行任务，不会有新的线程产生，所有任务都是在主线程上完成的
    
    NSLog(@"%@",[NSThread currentThread]);
    
    sleep(1);
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        sleep(2);
        NSLog(@"asyncThread--%@",[NSThread currentThread]);
        NSLog(@"1");
        
        //如果是子线程需要自己手动去启动runloop
        [self performSelector:@selector(test) withObject:nil afterDelay:.0];
        
        //手动去启动runloop
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
        NSLog(@"3");
    });
    NSLog(@"4");
}

-(void)test{
    NSLog(@"2");
}

-(void)test1{
    NSLog(@"test1Thread---%@",[NSThread currentThread]);
    NSLog(@"test1");
}

@end
