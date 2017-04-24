//
//  ViewController.m
//  FlashingLoader
//
//  Created by Phadatare, Shankar (Syntel) on 4/24/17.
//  Copyright © 2017 Phadatare, Shankar (Syntel). All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 100, 40)];
    view.backgroundColor = [UIColor lightGrayColor];//[UIColor colorWithRed:242.0f/255.0f green:242.0f/255.0f blue:242.0f/255.0f alpha:1.0];
    
    [self.view addSubview:view];
    
//    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    scaleAnimation.duration = 0.2;
//    scaleAnimation.repeatCount = HUGE_VAL;
//    scaleAnimation.autoreverses = YES;
//    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.2];
//    scaleAnimation.toValue = [NSNumber numberWithFloat:0.8];
//    
//    [view.layer addAnimation:scaleAnimation forKey:@"scale"];
    
    [self AddShineAnimationToView:view];
    
}

-(void)AddShineAnimationToView:(UIView*)aView
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    [gradient setStartPoint:CGPointMake(0, 0)];
    [gradient setEndPoint:CGPointMake(1, 0)];
    gradient.frame = CGRectMake(0, 0, aView.bounds.size.width*3, aView.bounds.size.height);
    float lowerAlpha = 0.8;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite:1 alpha:lowerAlpha] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:lowerAlpha] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:1.0] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:1.0] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:1.0] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:lowerAlpha] CGColor],
                       (id)[[UIColor colorWithWhite:1 alpha:lowerAlpha] CGColor],
                       nil];
    gradient.locations = [NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:0.0],
                          [NSNumber numberWithFloat:0.3],
                          [NSNumber numberWithFloat:0.45],
                          [NSNumber numberWithFloat:0.5],
                          [NSNumber numberWithFloat:0.55],
                          [NSNumber numberWithFloat:0.7],
                          [NSNumber numberWithFloat:1.0],
                          nil];
    
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    theAnimation.duration = 1.2;
    theAnimation.repeatCount = INFINITY;
    theAnimation.autoreverses = NO;
    theAnimation.removedOnCompletion = NO;
    theAnimation.fillMode = kCAFillModeForwards;
    theAnimation.fromValue=[NSNumber numberWithFloat:-aView.frame.size.width*2];
    theAnimation.toValue=[NSNumber numberWithFloat:0];
    [gradient addAnimation:theAnimation forKey:@"animateLayer"];
    
    aView.layer.mask = gradient;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
