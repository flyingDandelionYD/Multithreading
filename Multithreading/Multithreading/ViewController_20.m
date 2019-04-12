//
//  ViewController_20.m
//  Multithreading
//


#import "ViewController_20.h"

@interface ViewController_20 ()
@property (nonatomic,strong)dispatch_queue_t  queue;
@end

@implementation ViewController_20

- (void)viewDidLoad {
    [super viewDidLoad];
    self.queue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++) {
        [self read];
        [self read];
        [self read];
        [self write];
    }
}

- (void)read {
    dispatch_async(self.queue, ^{
        sleep(1);
        NSLog(@"read");
    });
}

- (void)write{
    dispatch_barrier_async(self.queue, ^{
        sleep(1);
        NSLog(@"write");
    });
}
@end
