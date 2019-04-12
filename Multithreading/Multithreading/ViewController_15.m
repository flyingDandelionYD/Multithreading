//
//  ViewController_15.m
//  Multithreading
//


#import "ViewController_15.h"
#import"SerialQueueDemo.h"

@interface ViewController_15 ()

@end

@implementation ViewController_15

- (void)viewDidLoad {
    [super viewDidLoad];
    SerialQueueDemo *demo = [[SerialQueueDemo alloc]init];
    [demo moneyTest];
    [demo ticketTest];
    NSLog(@"======");
}

@end
