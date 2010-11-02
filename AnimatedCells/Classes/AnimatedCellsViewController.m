    //
//  AnimatedCellsViewController.m
//  AnimatedCells
//
//  Created by Saurabh Garg on 11/2/10.
//  Copyright 2010 eBuddy BV. All rights reserved.
//

#import "AnimatedCellsViewController.h"
#import "GifVideo.h"
#import "VideoSource.h"
#import "PlayerView.h"

@implementation AnimatedCellsViewController

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
    }
	else {
		PlayerView *theAnimatedView = [[cell.contentView subviews] lastObject];
		[theAnimatedView stopAnimation];
		//[[[cell.contentView subviews] lastObject] stopAnimation];
	}
	
	//UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	
	cell.accessoryType = UITableViewCellAccessoryNone;
	
	//Add the animated image
	PlayerView *plView = [[[PlayerView alloc] initWithFrame:CGRectMake(260, 10, 30, 30)] autorelease];
	//[cell.contentView addSubview:plView];
	//PlayerView *plView = (PlayerView*)animatedView;
    
    // Load test.gif VideoSource
    NSString *str = [[NSBundle mainBundle] pathForResource:@"anim.gif" ofType:nil];
    FILE *fp = fopen([str UTF8String], "r");
    VideoSource *src = VideoSource_init(fp, VIDEOSOURCE_FILE);
    src->writeable = false;
    
    // Init video using VideoSource
    Video *vid = [[GifVideo alloc] initWithSource:src inContext:[plView context]];
    VideoSource_release(src);
    
    // Start if loaded
    if (vid) {
        [plView startAnimation:vid];
        [vid release];
    }
    
	cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
	[cell.contentView addSubview:plView];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
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
