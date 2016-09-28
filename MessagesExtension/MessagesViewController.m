//
//  MessagesViewController.m
//  MessagesExtension
//
//  Created by Oisin Prendiville on 28/09/2016.
//  Copyright © 2016 Oisin Prendiville. All rights reserved.
//

#import "MessagesViewController.h"


@interface MessagesViewController ()

@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Conversation Handling

- (IBAction)insertMessage:(id)sender
{
  MSMessage *message = [[MSMessage alloc] init];
  message.summaryText = @"Sample Message";
  
  MSMessageTemplateLayout *layout = [[MSMessageTemplateLayout alloc] init];
  layout.caption = @"Sample Caption";
  layout.subcaption = @"Sample Subcaption";
  
  message.layout = layout;
  
  [self.activeConversation insertMessage:message completionHandler:nil];
}

-(void)didBecomeActiveWithConversation:(MSConversation *)conversation {
  NSLog(@"💬 didBecomeActiveWithConversation");
}

-(void)willResignActiveWithConversation:(MSConversation *)conversation {
  NSLog(@"💬 willResignActiveWithConversation");
}

-(void)didReceiveMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
  NSLog(@"💬 didReceiveMessage");
}

-(void)didStartSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
  NSLog(@"💬 didStartSendingMessage");
}

-(void)didCancelSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
  NSLog(@"💬 didCancelSendingMessage");
}

-(void)willTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
  NSLog(@"💬 willTransitionToPresentationStyle");
}

-(void)didTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
  NSLog(@"💬 didTransitionToPresentationStyle");
}

- (void)didSelectMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
  NSLog(@"💬 didSelectMessage");
}

@end
