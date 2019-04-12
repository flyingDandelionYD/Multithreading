//
//  ViewController_9.m
//  Multithreading
//


#import "ViewController_9.h"
#import "MutexDemo.h"

@interface ViewController_9 ()

@end

@implementation ViewController_9

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MutexDemo *demo = [[MutexDemo alloc]init];
    [demo ticketTest];
    [demo moneyTest];
}

@end
