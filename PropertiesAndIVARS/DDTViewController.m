//
//  DDTViewController.m
//  PropertiesAndIVARS
//
//  Created by Daren David Taylor on 21/01/2014.
//  Copyright (c) 2014 com.DarenDavidTaylor. All rights reserved.
//

#import "DDTViewController.h"
#import "DDTViewControllerDelegate.h"

@interface DDTViewController ()

// the only time we need to use a category is when we need to do
// custom setter or getter, we could just use an IVAR and create our
// own setter AND getter, this way though the compiler creates
// a default getter and setter.
@property (nonatomic, strong) NSString *overloadedString;

@end

@implementation DDTViewController {
    
    // Same as using a strong property, implicit __strong qualification
    NSString *_privateString;
    
    // Same as using a weak outlet property
    __weak IBOutlet UIButton *_button;
    
    // assume this has been injected into the class
    __weak id<DDTViewControllerDelegate> _delegate;
}

// Avoid us accidentally using _overloadedString when we should be using self.overloadedString
// NOTE two underscores
@synthesize overloadedString = __overloadedString;

#pragma mark - Overloads

- (NSString *)overloadedString
{
    if (__overloadedString == nil) {
        __overloadedString = @"Overloaded value";
    }
    
    return __overloadedString;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // publicly visible
    self.publicString = @"Daren";
    
    // private
    _privateString = @"David";

    // private outlet
    _button.titleLabel.text = @"New Button Label";
    
    // private overload
    NSLog(@"%@", self.overloadedString);
    
    // private __weak delegate
    [_delegate delegateMethod];
}

@end
