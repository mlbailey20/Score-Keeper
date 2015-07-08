//
//  SKViewController.m
//  Score Keeper
//
//  Created by Robert Shepperd on 7/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKViewController.h"
int numViews = 0;
@interface SKViewController ()
//@property (nonatomic, readwrite) NSMutableArray  *_scoreLabels;
//@property (nonatomic, readwrite) NSMutableArray *_scoreViews;

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self._scoreLabels = [NSMutableArray new];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 1000)];
    
//    [self addScoreView:0];
//    [self addScoreView:1];
//    [self removeLastScore];
    [self updateButtonView];
    [self.view addSubview:self.scrollView];
    

}

- (void) addScoreView:(id)sender{
    NSInteger n =  numViews;
    float y = 50 + ( 50 * n );
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, y, CGRectGetWidth(self.view.frame), 50)];
    UITextField *name = [[UITextField alloc]initWithFrame:CGRectMake(0, y, 100, 50)];
        name.textColor = [UIColor cyanColor];
    name.placeholder = @"Enter Name";
    
    
    
    UILabel *score = [[ UILabel alloc]initWithFrame:CGRectMake(100, y, 100, 50)];
    score.backgroundColor = [UIColor purpleColor];
    score.textColor = [UIColor cyanColor];
    score.text = [NSString stringWithFormat:@"%d", 0 ];
       [__scoreLabels addObject: score];
    UIStepper *button = [[UIStepper alloc] initWithFrame:CGRectMake(200, y +10, 100, 50)];
    [button setBackgroundColor:[UIColor cyanColor]];
    button.tag = n;
    button.minimumValue = 0;
    button.maximumValue = 100;
    
    
    [button addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventTouchUpInside];
    
    //add all to new view
    [view addSubview:name];
    [view addSubview:score];
    [view addSubview:button];
    
    
    //add view to ScrollView
    
    [self.scrollView addSubview:view];
    
    [__scoreViews addObject:<#(id)#>];
      NSLog(@"%lu", (unsigned long)[__scoreViews count]);
    numViews++;
    //NSLog(@"%d",numViews);
    
}

-(void) removeLastScore:(id)sender{
    NSLog(@"%lu", (unsigned long)[__scoreViews count]);
    [__scoreViews[numViews-1] removeFromSuperview];
    [__scoreLabels removeLastObject];
    numViews--;
    
}

- (void) updateButtonView{
    
    if(self.addScore)
    {
        
    }
    else
    {
        _addScore = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
       UILabel *addScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        addScoreLabel.text = @"ADD";
        _addScore.backgroundColor = [UIColor greenColor];
        [_addScore addSubview:addScoreLabel];
        [self.scrollView addSubview:_addScore];
        
        
    }
    
    
    if(self.removeScore)
    {
    
    }
    else
    {
        _removeScore = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 50, 50)];
        UILabel *removeScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        removeScoreLabel.text = @"REM";
        _removeScore.backgroundColor = [UIColor redColor];
        [_removeScore addSubview:removeScoreLabel];
        [self.scrollView addSubview:_removeScore];
    }
    [_addScore addTarget:self action:@selector(addScoreView:) forControlEvents:UIControlEventTouchUpInside];
    [_removeScore addTarget:self action:@selector(removeLastScore:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) valueChanged: (id) sender {
    UIStepper *new = [[UIStepper alloc] init];
    new = sender;
    
    NSLog(@"%f", new.value);

    double value = [new value];
    
    UILabel *newScore = self._scoreLabels[new.tag];
    
    newScore.text = [NSString stringWithFormat:@"%d", (int)value];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
