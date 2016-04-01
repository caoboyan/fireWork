//
//  ViewController.m
//  fireAnimation
//
//  Created by Boyan Cao on 16/4/1.
//  Copyright © 2016年 2015-293. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView * supportView;

@property (nonatomic, strong) NSMutableArray * images;

@end

@implementation ViewController

-(NSMutableArray *)images{
    if (!_images) {
        _images = [[NSMutableArray alloc]init];
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int i = 0; i < 29; i++) {
        [self.images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"zan_000%zd",i]]];
    }
    self.supportView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 63, 55)];
    [self.supportView setImage:[UIImage imageNamed:@"zanUnSelect"]];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fireAction)];
    self.supportView.userInteractionEnabled = YES;
    [self.supportView addGestureRecognizer:tap];
    self.supportView.tag = 0;
    [self.view addSubview:self.supportView];
}

- (void)fireAction{
    if (self.supportView.tag == 0) {
        [self.supportView setImage:[UIImage imageNamed:@"zan_00020"]];
        self.supportView.animationImages = self.images;
        self.supportView.animationDuration = 20/30;
        self.supportView.animationRepeatCount = 1;
        [self.supportView startAnimating];
        self.supportView.tag = 1;
    }else{
        [self.supportView setImage:[UIImage imageNamed:@"zanUnSelect"]];
        self.supportView.tag = 0;
    }
    

}

@end
