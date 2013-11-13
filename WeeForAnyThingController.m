//
//  WeeForAnyThingController.m
//  WeeForAnyThing
//
//  Created by iMokhles on 10/6/13.
//  Copyright (c) 2013-2014 iMokhles LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBWeeAppController-Protocol.h"
#import <SpringBoard/SpringBoard.h>
#import <MediaPlayer/MediaPlayer.h>
#import <objc/runtime.h>
#import <SpringBoard/SBBrightnessController.h>

static NSBundle *_WeeForAnyThingWeeAppBundle = nil;
static UITextField *textCydia;
static NSString *cydia;
static UIScrollView *scrollView;

@interface WeeForAnyThingController: NSObject <BBWeeAppController, UIActionSheetDelegate> {
	UIView *_view;
	UIImageView *_backgroundView;
      
}
@property (nonatomic, retain) UIView *view;
@end

@implementation WeeForAnyThingController
@synthesize view = _view;

+ (void)initialize {
	_WeeForAnyThingWeeAppBundle = [[NSBundle bundleForClass:[self class]] retain];
}

- (id)init {
	if((self = [super init]) != nil) {
		
	} return self;
}

- (void)dealloc {
	[_view release];
	[_backgroundView release];
	[super dealloc];
}

- (void)loadFullView {
	// Add subviews to _backgroundView (or _view) here.

	scrollView = [[UIScrollView alloc] init];
	scrollView.frame = CGRectMake(0,0,_view.bounds.size.width,_view.bounds.size.height);
	    scrollView.contentSize = CGSizeMake(_view.bounds.size.width, _view.bounds.size.height);
	    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width*2, _view.bounds.size.height);
	
	scrollView.pagingEnabled = YES;
	scrollView.scrollsToTop = NO;
	[scrollView setClipsToBounds:NO];
	scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	[_view addSubview:scrollView];

 UIButton *wifi = [UIButton buttonWithType:UIButtonTypeCustom];

    [wifi setBackgroundImage:[UIImage imageWithContentsOfFile:[_WeeForAnyThingWeeAppBundle pathForResource:@"Wireless" ofType:@"png"]] forState:UIControlStateNormal];

    wifi.frame = CGRectMake(70,0,42,42);

    [wifi addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchDown];

UIButton *music = [UIButton buttonWithType:UIButtonTypeCustom];

    [music setBackgroundImage:[UIImage imageWithContentsOfFile:[_WeeForAnyThingWeeAppBundle pathForResource:@"Music" ofType:@"png"]] forState:UIControlStateNormal];

    music.frame = CGRectMake(137,0,42,42);

    [music addTarget:self action:@selector(button3Action) forControlEvents:UIControlEventTouchDown];

UIButton *menu = [UIButton buttonWithType:UIButtonTypeCustom];

    [menu setBackgroundImage:[UIImage imageWithContentsOfFile:[_WeeForAnyThingWeeAppBundle pathForResource:@"List" ofType:@"png"]] forState:UIControlStateNormal];

    menu.frame = CGRectMake(204,0,42,42);

    [menu addTarget:self action:@selector(button4Action) forControlEvents:UIControlEventTouchDown];

UIButton *net = [UIButton buttonWithType:UIButtonTypeCustom];

    [net setBackgroundImage:[UIImage imageWithContentsOfFile:[_WeeForAnyThingWeeAppBundle pathForResource:@"Internet" ofType:@"png"]] forState:UIControlStateNormal];

    net.frame = CGRectMake(271,0,42,42);

    [net addTarget:self action:@selector(button5Action) forControlEvents:UIControlEventTouchDown];

UIButton *sms = [UIButton buttonWithType:UIButtonTypeCustom];

    [sms setBackgroundImage:[UIImage imageWithContentsOfFile:[_WeeForAnyThingWeeAppBundle pathForResource:@"SMS" ofType:@"png"]] forState:UIControlStateNormal];

    sms.frame = CGRectMake(3,0,42,42);

    [sms addTarget:self action:@selector(button6Action) forControlEvents:UIControlEventTouchDown];

UIButton *tw = [UIButton buttonWithType:UIButtonTypeCustom];

    [tw setBackgroundImage:[UIImage imageWithContentsOfFile:[_WeeForAnyThingWeeAppBundle pathForResource:@"twitter" ofType:@"png"]] forState:UIControlStateNormal];

    tw.frame = CGRectMake(338,0,42,42);

    [tw addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchDown];


    [_view addSubview:wifi];
    [scrollView addSubview:wifi];
    [_view addSubview:music];
    [scrollView addSubview:music];
    [_view addSubview:menu];
    [scrollView addSubview:menu];
    [_view addSubview:net];
    [scrollView addSubview:net];
    [_view addSubview:sms];
    [scrollView addSubview:sms];
    [_view addSubview:tw];
    [scrollView addSubview:tw];

}

- (void)button1Action {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"مخلص حسين iMokhles"
														  message: @"مطور بسيط جدا قام بتطوير عدة ادوات السيديا البسيطة و ثيمات ايضا مصري الجنسية و صاحب اول اداة جيلبريك عربية عرب سنو.."
														 delegate: nil
												cancelButtonTitle: nil
												otherButtonTitles: @"Ok", nil];
	[alert show];
	[alert release];
}

- (void)button2Action {
	UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0,0,640,920)];

    // do something, e.g. set the background color to red
    newView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PageTwoViewController_Image_1.png"]];

    // add the new view as a subview to an existing one (e.g. self.view)
    [_view addSubview:newView];

    // release the newView as -addSubview: will retain it
    [newView release];

 }

- (void)button3Action {

	[[objc_getClass("SBMediaController") sharedInstance] togglePlayPause];

}

- (void)button4Action {
 
 [objc_getClass("SBUIController") sharedInstance];
[sharedController _toggleSwitcher];
}

- (void)button5Action {

[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.google.com"]];

}

- (void)button6Action {

NSURL *smsURL = [NSURL URLWithString:@"sms:"];
    [[UIApplication sharedApplication] openURL:smsURL];

}

- (void)loadPlaceholderView {
	// This should only be a placeholder - it should not connect to any servers or perform any intense
	// data loading operations.
	//
	// All widgets are 316 points wide. Image size calculations match those of the Stocks widget.
	_view = [[UIView alloc] initWithFrame:(CGRect){CGPointZero, {316.f, [self viewHeight]}}];
	_view.autoresizingMask = UIViewAutoresizingFlexibleWidth;

	UIImage *bgImg = [UIImage imageWithContentsOfFile:@"/System/Library/WeeAppPlugins/StocksWeeApp.bundle/WeeAppBackground.png"];
	UIImage *stretchableBgImg = [bgImg stretchableImageWithLeftCapWidth:floorf(bgImg.size.width / 2.f) topCapHeight:floorf(bgImg.size.height / 2.f)];
	_backgroundView = [[UIImageView alloc] initWithImage:stretchableBgImg];
	_backgroundView.frame = CGRectInset(_view.bounds, 2.f, 0.f);
	_backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	[_view addSubview:_backgroundView];
}

- (void)unloadView {
	[_view release];
	_view = nil;
	[_backgroundView release];
	_backgroundView = nil;
	// Destroy any additional subviews you added here. Don't waste memory :(.
}

- (float)viewHeight {
	return 42.f;
}

@end
