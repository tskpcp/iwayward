//
//  EGORefreshTableHeaderView.h
//  Demo
//
//  Created by Devin Doty on 10/14/09October14.
//  Copyright 2009 enormego. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
	up_EGOOPullRefreshPulling = 0,
	up_EGOOPullRefreshNormal,
	up_EGOOPullRefreshLoading,	
} up_EGOPullRefreshState;

@protocol up_EGORefreshTableHeaderDelegate;
@interface up_EGORefreshTableHeaderView : UIView {
	
	id _delegate;
	up_EGOPullRefreshState _state;

	UILabel *_lastUpdatedLabel;
	UILabel *_statusLabel;
	CALayer *_arrowImage;
	UIActivityIndicatorView *_activityView;
	

}

@property(nonatomic,assign) id <up_EGORefreshTableHeaderDelegate> delegate;

- (void)up_refreshLastUpdatedDate;
- (void)up_egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)up_egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)up_egoRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

@end
@protocol up_EGORefreshTableHeaderDelegate
- (void)up_egoRefreshTableHeaderDidTriggerRefresh:(up_EGORefreshTableHeaderView*)view;
- (BOOL)up_egoRefreshTableHeaderDataSourceIsLoading:(up_EGORefreshTableHeaderView*)view;
@optional
- (NSDate*)up_egoRefreshTableHeaderDataSourceLastUpdated:(up_EGORefreshTableHeaderView*)view;
@end
