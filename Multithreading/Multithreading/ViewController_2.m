//
//  ViewController_2.m
//  Multithreading
//


#import "ViewController_2.h"

@interface ViewController_2 ()

@end

@implementation ViewController_2

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)test{
    NSLog(@"2");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"1");
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }];
    
    [thread start];
    [self performSelector:@selector(test) onThread:thread withObject:nil waitUntilDone:YES];


    sleep(2);
    NSLog(@"===End====");
}

-(void)dealloc{
    NSLog(@"%s",__FUNCTION__);
}
@end
