//
//  ViewController.m
//  test_ltnavigationbar
//
//  Created by sangen on 15/5/31.
//  Copyright (c) 2015年 sangen. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+Awesome.h"
#define NAVBAR_CHANGE_POINT -64
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
    self.leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    
    [ self.leftButton setImage:[UIImage imageNamed:@"icon_navi_detail_back@2x.png"] forState:UIControlStateNormal];
    
//    [leftButton addTarget:self action:@selector(backToLastView)forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView: self.leftButton];
    
    self.navigationItem.leftBarButtonItem= leftItem;
    
//    self.navigationItem.title = @"周边游线路";
    //添加更多按钮
    
    self.moreButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    
    [self.moreButton setImage:[UIImage imageNamed:@"icon_navi_detail_share@2x.png"] forState:UIControlStateNormal];
  UIBarButtonItem * moreItem = [[UIBarButtonItem alloc]initWithCustomView:self.moreButton];
    
    self.moreButton1 = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    
    [self.moreButton1 setImage:[UIImage imageNamed:@"icon_navi_detail_favorite_off@2x.png"] forState:UIControlStateNormal];
    UIBarButtonItem * moreItem1 = [[UIBarButtonItem alloc]initWithCustomView:self.moreButton1];
    NSArray *buttonArray = [[NSArray alloc] initWithObjects:moreItem,moreItem1 ,nil];
    self.navigationItem.rightBarButtonItems = buttonArray;
    [self.tableView sendSubviewToBack:self.top_img];
    
   self.top_img.contentMode = UIViewContentModeScaleAspectFill;
    self.cachedImageViewSize = self.top_img.frame;
    self.cachedImageViewcenter=self.top_img.center;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
 
  
    if (offsetY<-64) {
        CGFloat offset=64+offsetY;
        offset=-offset;
        self.top_img.frame = CGRectMake(0, offsetY, self.cachedImageViewSize.size.width+offset, self.cachedImageViewSize.size.height+offset);
        self.top_img.center = CGPointMake(self.view.center.x, self.top_img.center.y);
    }
 
    
    

    
    
    
    if (offsetY > NAVBAR_CHANGE_POINT) {
        //        CGFloat alpha = 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64);
        CGFloat alpha = ((64 +offsetY) / 64);
        
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
         [ self.leftButton setImage:[UIImage imageNamed:@"icon_navi_detail_back_active@2x.png"] forState:UIControlStateNormal];
        [self.moreButton setImage:[UIImage imageNamed:@"btn_new_common_share_pressed@2x.png"] forState:UIControlStateNormal];
         [self.moreButton1 setImage:[UIImage imageNamed:@"icon_navi_detail_favorite_off_active@2x.png"] forState:UIControlStateNormal];
            self.navigationItem.title = @"周边游线路";
        UIColor *	titleColor=[[UIColor blackColor] colorWithAlphaComponent:alpha];
        NSMutableDictionary * attributes = [NSMutableDictionary dictionary];
       
        if ( titleColor )
        {
            [attributes setObject:titleColor forKey:NSForegroundColorAttributeName];
        }
        
        [attributes setObject:[UIFont fontWithName:@"Arial" size:17.0] forKey:NSFontAttributeName];
        
        if ( attributes.count )
        {
            [self.navigationController.navigationBar setTitleTextAttributes:attributes];
        }
//        NSDictionary *size = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Arial" size:11.0],NSFontAttributeName, nil];
//        
//        self.navigationController.navigationBar.titleTextAttributes = size;

    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
         [ self.leftButton setImage:[UIImage imageNamed:@"icon_navi_detail_back@2x.png"] forState:UIControlStateNormal];
        [self.moreButton setImage:[UIImage imageNamed:@"icon_navi_detail_share@2x.png"] forState:UIControlStateNormal];
        [self.moreButton1 setImage:[UIImage imageNamed:@"icon_navi_detail_favorite_off@2x.png"] forState:UIControlStateNormal];
        self.navigationItem.title = @"";
    }

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar lt_reset];
}

#pragma mark UITableViewDatasource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"header";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"text";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

@end
