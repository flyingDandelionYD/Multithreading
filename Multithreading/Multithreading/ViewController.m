//
//  ViewController.m
//  Multithreading
//


#import "ViewController.h"

 static NSString *const idF = @"ViewController";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView  *baseV;
@property (nonatomic,strong)NSArray  *sourcesArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"多线程";
    [self setUpUI];
}

-(NSArray*)sourcesArr{
    if(_sourcesArr==nil){
        _sourcesArr = @[
                        @"面试题一",
                        @"面试题二",
                        @"示例",
                        @"死锁",
                        @"队列组的使用",
                        @"多线程安全隐患演示",
                        @"OSSpinLock",
                        @"os_unfair_lock",
                        @"pthread_mutex",
                        @"pthread_mutex–递归锁",
                        @"pthread_mutex – 条件",
                        @"NSLock、NSRecursiveLock",
                        @"NSCondition",
                        @"NSConditionLock",
                        @"SerialQueue",
                        @"Semaphore",
                        @"@synchronized",
                        @"atomic",
                        @"pthread_rwlock",
                        @"dispatch_barrier_async"
                        ];  
    }
    return _sourcesArr;
}

-(void)setUpUI{
    self.baseV = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.baseV];
    self.baseV.delegate =self;
    self.baseV.dataSource = self;
    [self.baseV registerClass:[UITableViewCell class] forCellReuseIdentifier:idF];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourcesArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell  =  [tableView dequeueReusableCellWithIdentifier:idF forIndexPath:indexPath];
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idF];
    }
    cell.textLabel.text = self.sourcesArr[indexPath.row];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class cla = NSClassFromString([NSString stringWithFormat:@"ViewController_%ld",indexPath.row+1]);
    UIViewController  *vc = (UIViewController *)[cla new];
    vc.title = self.sourcesArr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
