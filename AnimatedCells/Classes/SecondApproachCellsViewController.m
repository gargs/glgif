//
//  SecondApproachCellsViewController.m
//  AnimatedCells
//
//  Created by Saurabh Garg on 11/11/10.
//  Copyright 2010 eBuddy BV. All rights reserved.
//

#import "SecondApproachCellsViewController.h"
#import "AnimatedGif.h"

@implementation SecondApproachCellsViewController

- (void)loadView {
	[super loadView];
	tableView_ = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
	tableView_.delegate = self;
	tableView_.dataSource = self;
	[self.view addSubview:tableView_];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		UIImageView *iconView = [AnimatedGif getAnimationForGifAtUrl:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"anim" ofType:@"gif"]]];
		[cell.contentView addSubview:iconView];
    }
	
	//UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	
	cell.accessoryType = UITableViewCellAccessoryNone;
	
	[[[cell.contentView subviews] lastObject] startAnimating];
	
    
	//cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
	
    return cell;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end