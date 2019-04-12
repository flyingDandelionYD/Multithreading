//
//  ViewController_17.m
//  Multithreading
//


#import "ViewController_17.h"
#import "SynchronizedDemo.h"

@interface ViewController_17 ()

@end

@implementation ViewController_17

- (void)viewDidLoad {
    [super viewDidLoad];
    SynchronizedDemo *demo = [[SynchronizedDemo alloc]init];
    [demo moneyTest];
    [demo ticketTest];
    [demo otherTest];
}


@end
