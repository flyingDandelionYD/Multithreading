//
//  ViewController_11.m
//  Multithreading
//


#import "ViewController_11.h"
#import "MutexDemo3.h"

@interface ViewController_11 ()

@end

@implementation ViewController_11

- (void)viewDidLoad {
    [super viewDidLoad];
    MutexDemo3 *demo = [[MutexDemo3 alloc]init];
    [demo otherTest];
}
@end
