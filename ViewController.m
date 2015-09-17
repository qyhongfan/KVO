//
//  ViewController.m
//  KVO
//
//  Created by 覃玉红 on 15/9/17.
//  Copyright (c) 2015年 覃玉红. All rights reserved.
//

#import "ViewController.h"
#import "PersonModel.h"

@interface ViewController ()
@property (nonatomic, strong) PersonModel *person;
@property (nonatomic, strong) UILabel *ageLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _person = [[PersonModel alloc] initWithAge:20];
    [_person addObserver:self
              forKeyPath:@"age"
                 options:NSKeyValueObservingOptionNew
                 context:nil];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(addAge) userInfo:nil repeats:YES];
    [[NSRunLoop  currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 150, 200, 35)];
    _ageLabel.text = [NSString stringWithFormat:@"Hong is %d old",_person.age];
    _ageLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_ageLabel];
}


-(void)addAge{
    _person.age = _person.age + 2;
    if (_person.age>51) {
        _person.age=20;
    }
}


-(void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary *)change context:(nullable void *)context{
    if ([keyPath isEqualToString:@"age" ] && object == _person) {
        _ageLabel.text = [NSString stringWithFormat:@"Hong is %d old",_person.age];
        
    }
}



@end
