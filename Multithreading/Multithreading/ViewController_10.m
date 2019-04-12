//
//  ViewController_10.m
//  Multithreading
//


#import "ViewController_10.h"
#import "MutexDemo2.h"

@interface ViewController_10 ()

@end

@implementation ViewController_10

- (void)viewDidLoad {
    [super viewDidLoad];
    MutexDemo2 *demo = [[MutexDemo2 alloc]init];
    [demo otherTest];
}


@end
