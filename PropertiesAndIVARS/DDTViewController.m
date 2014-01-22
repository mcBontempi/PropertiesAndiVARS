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

@property (nonatomic, strong) NSString *privateOverloadedString;

@end

@implementation DDTViewController {
    
    // Same as using a strong property, implicit __strong qualification
    NSString *_iVarString;
    
    // Same as using a weak outlet property
    __weak IBOutlet UIButton *_button;
    
    __weak id<DDTViewControllerDelegate> delegate;
}

// Avoid us accidentally calling _privateOverloadedString, NOTE two underscores
@synthesize privateOverloadedString = __privateOverloadedString;

- (void)setPrivateOverloadedString:(NSString *)privateOverloadedString
{
    __privateOverloadedString = privateOverloadedString;

    // do something here as usual in an overloaded setter
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.publicString = @"Daren";
    
    _iVarString = @"David";
    
    self.privateOverloadedString = @"Taylor";
}

@end
