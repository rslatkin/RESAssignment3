//
//  ViewController.m
//  RESAssignment3
//
//  Created by Robert Slatkin on 2/12/15.
//  Copyright (c) 2015 Robert Slatkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (instancetype)initWithNibName:(NSString *)nibNameorNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameorNil bundle:nibBundleOrNil];
    
    if (self) {
        _responseString = [[NSMutableString alloc] initWithCapacity:0];

    }
    // Return the address of the new object;
    return self;
}


- (IBAction)loadURL:(id)sender
{
    [_urlField resignFirstResponder];
    NSString *simpleAddr = [_urlField text];
    
    if (simpleAddr == nil || [simpleAddr isEqualToString:@""] )
    {
        simpleAddr = @"http://www.pitt.edu";
    }
    
    if ([simpleAddr hasPrefix:@"http://"]) {
        simpleAddr = simpleAddr;
    } else {
        if(simpleAddr)
        {
            simpleAddr = [@"http://@" stringByAppendingString:simpleAddr];
        }
    }
    
    NSURL *url = [NSURL URLWithString:simpleAddr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if(conn!=nil)
    {
        [conn start];
    }
    
    [_urlPage loadRequest:request];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSString *newData = [NSString stringWithUTF8String:[data bytes]];
    
    
    if(newData)
    {
        [_responseString appendString:newData];
    }
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    [error localizedDescription];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    

     UIAlertView *uiAlert = [[UIAlertView alloc] initWithTitle:@"Done!" message:@"Data is here!" delegate:self
                                        cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [uiAlert show];
    
}



@end
