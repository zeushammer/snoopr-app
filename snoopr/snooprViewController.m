//
//  snooprViewController.m
//  snoopr
//
//  Created by Gerhold, Andrew on 8/26/14.
//  Copyright (c) 2014 iOSlearning. All rights reserved.
//

#import "snooprViewController.h"
#import "CardSelector.h"

#import <MDCSwipeToChoose/MDCSwipeToChoose.h>

@interface snooprViewController ()

@property (nonatomic, strong) CardSelector *selector;
@property (weak, nonatomic) IBOutlet UIButton *viewCardA;
@property (weak, nonatomic) IBOutlet UIButton *viewCardB;

@end

@implementation snooprViewController

- (IBAction)clickViewCard:(UIButton *)sender
{
    //call sendSubviewToBack...
    [self.view sendSubviewToBack:sender];
    [self.selector selectNextCard];
    
    // create some Card init fn
    [sender setTitle:self.selector.nextCard.contents forState:UIControlStateNormal];
}

#pragma mark - Creating and Customizing a MDCSwipeToChooseView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // You can customize MDCSwipeToChooseView using MDCSwipeToChooseViewOptions.
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.likedText = @"Keep";
    options.likedColor = [UIColor blueColor];
    options.nopeText = @"Delete";
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            NSLog(@"Let go now to delete the photo!");
        }
    };
    
    MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:self.view.bounds
                                                                     options:options];
    view.imageView.image = [UIImage imageNamed:@"jake"];
    [self.view addSubview:view];
}

#pragma mark - MDCSwipeToChooseDelegate Callbacks

// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view {
    NSLog(@"Couldn't decide, huh?");
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"Photo deleted!");
    } else {
        NSLog(@"Photo saved!");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

@end
