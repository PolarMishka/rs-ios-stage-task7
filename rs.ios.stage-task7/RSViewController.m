//
//  RSViewController.m
//  rs.ios.stage-task7
//
//  Created by Mishka on 04.07.2021.
//

#import "RSViewController.h"

@interface RSViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *authorizeButton;

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup loginField
    self.loginField.layer.borderColor = [[UIColor colorNamed:@"Black Coral"] CGColor];;
    self.loginField.layer.borderWidth = 1.5;
    self.loginField.layer.cornerRadius = 5.0;
    
    // setup passwordField
    self.passwordField.layer.borderColor = [[UIColor colorNamed:@"Black Coral"] CGColor];
    self.passwordField.layer.borderWidth = 1.5;
    self.passwordField.layer.cornerRadius = 5.0;
    
    // setup authorizeButton
    self.authorizeButton.layer.borderColor = [[UIColor colorNamed:@"Little Boy Blue"] CGColor];
    self.authorizeButton.layer.borderWidth = 2.0;
    self.authorizeButton.layer.cornerRadius = 10.0;
    
    // Add tarrget and selection for authorizeButton
        [self.authorizeButton addTarget:self
                            action:@selector(saveButtonTapped:)
                  forControlEvents:UIControlEventTouchUpInside];
    
    // Add tarrget and selection for change button color
        [self.authorizeButton addTarget:self
                            action:@selector(changeColor:)
                  forControlEvents:UIControlEventTouchDown];
    
    // Add tarrget and selection for return fields border color
    [self.loginField addTarget:self action:@selector(returnFieldstBorderColor:) forControlEvents:UIControlEventEditingChanged];
    [self.passwordField addTarget:self action:@selector(returnFieldstBorderColor:) forControlEvents:UIControlEventEditingChanged];
    
    // Subscrube on keyboard events
    [self hideWhenTappedAround];
    
    // Set delegates
    self.loginField.delegate = self;
    self.passwordField.delegate = self;
    
    
}

// ==========================================================

- (void)saveButtonTapped:(UIButton *)sender {
    self.authorizeButton.layer.backgroundColor = [[UIColor colorNamed:@"White"] CGColor];
        if ([self.loginField.text isEqual: @"login"] && [self.passwordField.text isEqual: @"password"]) {
            
            [self hideFieldsAndButton];
            [self enableSecureButton];
        }
    
    NSLog(@"LOG SAY: button tapped");
}
  
// method for change background collor of button and border color of fields
- (void)changeColor:(UIButton *)sender {
    self.authorizeButton.layer.backgroundColor = [[[UIColor colorNamed:@"Little Boy Blue"] colorWithAlphaComponent:0.2] CGColor];
    if (![self.loginField.text isEqual: @"login"]) {
        self.loginField.layer.borderColor = [[UIColor colorNamed:@"Venetian Red"] CGColor];
    }
    if (![self.passwordField.text isEqual: @"password"]) {
        self.passwordField.layer.borderColor = [[UIColor colorNamed:@"Venetian Red"] CGColor];
    }
}

// UITextField deligate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [self.passwordField becomeFirstResponder];
}
// method for return start border color of fields
- (void)returnFieldstBorderColor:(UITextField *)sender {
    if (self.loginField.isFirstResponder) {
        self.loginField.layer.borderColor = [[UIColor colorNamed:@"Black Coral"] CGColor];
    }
    if (self.passwordField.isFirstResponder) {
    self.passwordField.layer.borderColor = [[UIColor colorNamed:@"Black Coral"] CGColor];
    }
}

// hide keyboard when tapped around
- (void)hideWhenTappedAround {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(hide)];
    [self.view addGestureRecognizer:gesture];
}

- (void)hide {
    [self.view endEditing:true];
}

// disable loginField passwordField fields and authorizeButton
- (void)hideFieldsAndButton {
    
    [self.loginField setEnabled:NO];
    [self.passwordField setEnabled:NO];
    [self.authorizeButton setEnabled:NO];
    [self.authorizeButton setAlpha:0.5];
    [self.loginField setAlpha:0.5];
    [self.passwordField setAlpha:0.5];
    
}

// secure button
- (void)enableSecureButton {
    
}

@end
