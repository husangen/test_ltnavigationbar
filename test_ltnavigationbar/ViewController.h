//
//  ViewController.h
//  test_ltnavigationbar
//
//  Created by sangen on 15/5/31.
//  Copyright (c) 2015年 sangen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic)  UIButton *leftButton;
@property (retain, nonatomic)  UIButton * moreButton;
@property (retain, nonatomic)  UIButton * moreButton1;
@property (weak, nonatomic) IBOutlet UIImageView *top_img;
@property(nonatomic) CGRect cachedImageViewSize;
@property(nonatomic) CGPoint cachedImageViewcenter;
@end

