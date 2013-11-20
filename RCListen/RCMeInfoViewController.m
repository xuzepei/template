//
//  RCMeInfoViewController.m
//  RCFang
//
//  Created by xuzepei on 10/21/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCMeInfoViewController.h"
#import "RCHttpRequest.h"
#import "RCHttpRequestManager.h"

@interface RCMeInfoViewController ()

@end

@implementation RCMeInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:20.0];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = NAVIGATION_BAR_TITLE_COLOR;
        self.navigationItem.titleView = titleLabel;
        titleLabel.text = @"个人资料";
        [titleLabel sizeToFit];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.tableView = nil;
    self.tf0 = nil;
    self.tf1 = nil;
    self.tf2 = nil;
    self.tf3 = nil;
    self.tf4 = nil;
    self.tf5 = nil;
    self.tf6 = nil;
    self.tf7 = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0,0, 52, 33);
    [button setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"fanhui_on"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(clickedLeftBarButtonItem:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:button] autorelease];
    
    [self initTextFields];
    
    [self initTableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickedLeftBarButtonItem:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateContent:(NSString*)params
{
    if(0 == [params length])
        return;
    
    NSString* urlString = [NSString stringWithFormat:@"%@/user_info.php?apiid=%@&pwd=%@",BASE_URL,APIID,PWD];
    NSString* token = [NSString stringWithFormat:@"username=%@&type=info&%@",[RCTool getUsername],params];
    RCHttpRequest* temp = [[[RCHttpRequest alloc] init] autorelease];
    BOOL b = [temp post:urlString delegate:self resultSelector:@selector(finishedRequest:) token:token];
    if(b)
    {
        [RCTool showIndicator:@"请稍候..."];
    }
}

- (void)finishedRequest:(NSString*)jsonString
{
    [RCTool hideIndicator];
    
    if(0 == [jsonString length])
        return;
    
    NSDictionary* result = [RCTool parseToDictionary: jsonString];
    if(result && [result isKindOfClass:[NSDictionary class]])
    {
        NSString* error = [result objectForKey:@"error"];
        if(0 == [error length])
        {
            [[RCHttpRequestManager sharedInstance] requestUserInfo];
            return;
        }
        else
        {
            [RCTool showAlert:@"提示" message:error];
        }
        
        return;
    }
    
}

#pragma mark - TextFields
- (void)initTextFields
{
    if(nil == _tf0)
    {
        _tf0 = [[UITextField alloc] initWithFrame:CGRectMake(80, 12, 200, 30)];
        _tf0.tag = 1000;
        _tf0.font = [UIFont systemFontOfSize:16];
        _tf0.textColor = [UIColor grayColor];
        _tf0.backgroundColor = [UIColor clearColor];
        _tf0.borderStyle = UITextBorderStyleNone;
        _tf0.delegate = self;
        _tf0.returnKeyType = UIReturnKeyDone;
        _tf0.enabled = NO;
    }
    
    if(nil == _tf1)
    {
        _tf1 = [[UITextField alloc] initWithFrame:CGRectMake(80, 12, 200, 30)];
        _tf1.tag = 1001;
        _tf1.font = [UIFont systemFontOfSize:16];
        _tf1.textColor = [UIColor grayColor];
        _tf1.backgroundColor = [UIColor clearColor];
        _tf1.borderStyle = UITextBorderStyleNone;
        _tf1.delegate = self;
        _tf1.returnKeyType = UIReturnKeyDone;
    }
    
    if(nil == _tf2)
    {
        _tf2 = [[UITextField alloc] initWithFrame:CGRectMake(80, 12, 200, 30)];
        _tf2.tag = 1002;
        _tf2.font = [UIFont systemFontOfSize:16];
        _tf2.textColor = [UIColor grayColor];
        _tf2.backgroundColor = [UIColor clearColor];
        _tf2.borderStyle = UITextBorderStyleNone;
        _tf2.delegate = self;
        _tf2.returnKeyType = UIReturnKeyDone;
    }
    
    
    if(nil == _tf3)
    {
        _tf3 = [[UITextField alloc] initWithFrame:CGRectMake(80, 12, 200, 30)];
        _tf3.tag = 1003;
        _tf3.font = [UIFont systemFontOfSize:16];
        _tf3.textColor = [UIColor grayColor];
        _tf3.backgroundColor = [UIColor clearColor];
        _tf3.borderStyle = UITextBorderStyleNone;
        _tf3.delegate = self;
        _tf3.returnKeyType = UIReturnKeyDone;
    }
    
    if(nil == _tf4)
    {
        _tf4 = [[UITextField alloc] initWithFrame:CGRectMake(80, 12, 200, 30)];
        _tf4.tag = 1004;
        _tf4.font = [UIFont systemFontOfSize:16];
        _tf4.textColor = [UIColor grayColor];
        _tf4.backgroundColor = [UIColor clearColor];
        _tf4.borderStyle = UITextBorderStyleNone;
        _tf4.delegate = self;
        _tf4.returnKeyType = UIReturnKeyDone;
    }
    
    if(nil == _tf5)
    {
        _tf5 = [[UITextField alloc] initWithFrame:CGRectMake(100, 12, 200, 30)];
        _tf5.tag = 1000;
        _tf5.font = [UIFont systemFontOfSize:16];
        _tf5.textColor = [UIColor grayColor];
        _tf5.backgroundColor = [UIColor clearColor];
        _tf5.borderStyle = UITextBorderStyleNone;
        _tf5.delegate = self;
        _tf5.returnKeyType = UIReturnKeyDone;
        _tf5.enabled = NO;
    }
    
    if(nil == _tf6)
    {
        _tf6 = [[UITextField alloc] initWithFrame:CGRectMake(100, 12, 200, 30)];
        _tf6.tag = 1000;
        _tf6.font = [UIFont systemFontOfSize:16];
        _tf6.textColor = [UIColor grayColor];
        _tf6.backgroundColor = [UIColor clearColor];
        _tf6.borderStyle = UITextBorderStyleNone;
        _tf6.delegate = self;
        _tf6.returnKeyType = UIReturnKeyDone;
        _tf6.enabled = NO;
    }
    
    
    if(nil == _tf7)
    {
        _tf7 = [[UITextField alloc] initWithFrame:CGRectMake(100, 12, 200, 30)];
        _tf7.tag = 1000;
        _tf7.font = [UIFont systemFontOfSize:16];
        _tf7.textColor = [UIColor grayColor];
        _tf7.backgroundColor = [UIColor clearColor];
        _tf7.borderStyle = UITextBorderStyleNone;
        _tf7.delegate = self;
        _tf7.returnKeyType = UIReturnKeyDone;
        _tf7.enabled = NO;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    if(1002 == textField.tag)
    {
        NSString* numbers = @"0123456789.";
        NSCharacterSet* cs = [[NSCharacterSet characterSetWithCharactersInString:numbers] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL b = [string isEqualToString:filtered];
        if(!b)
        {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(1001 == textField.tag)
    {
        if([textField.text length] && NO == [textField.text isEqualToString:@"未填写"])
        {
            NSString* temp = [NSString stringWithFormat:@"name=%@",textField.text];
            [self updateContent:temp];
        }
    }
    else if(1002 == textField.tag)
    {
        if([textField.text length]&& NO == [textField.text isEqualToString:@"未填写"])
        {
            NSString* temp = [NSString stringWithFormat:@"qq=%@",textField.text];
            [self updateContent:temp];
        }
    }
    else if(1003 == textField.tag)
    {
        if([textField.text length]&& NO == [textField.text isEqualToString:@"未填写"])
        {
            NSString* temp = [NSString stringWithFormat:@"email=%@",textField.text];
            [self updateContent:temp];
        }
    }
    else if(1004 == textField.tag)
    {
        if([textField.text length]&& NO == [textField.text isEqualToString:@"未填写"])
        {
            if(NO == [textField.text isEqualToString:@"男"] && NO == [textField.text isEqualToString:@"女"])
            {
                [RCTool showAlert:@"提示" message:@"请输入正确的性别！"];
            }
            else
            {
                NSString* temp = [NSString stringWithFormat:@"sex=%@",textField.text];
                [self updateContent:temp];
            }
        }
    }
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - UITableView

- (void)initTableView
{
    if(nil == _tableView)
    {
        CGFloat tabBarHeight = TAB_BAR_HEIGHT;
        if(self.hidesBottomBarWhenPushed)
            tabBarHeight = 0.0;
        
        //init table view
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,[RCTool getScreenSize].width,[RCTool getScreenSize].height - STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT - tabBarHeight)
                                                  style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.opaque = NO;
        _tableView.backgroundView = nil;
        _tableView.dataSource = self;
        //_tableView.separatorColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
	
	[self.view addSubview:_tableView];
    
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;//[[[UIView alloc] initWithFrame:CGRectZero] autorelease];
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (id)getCellDataAtIndexPath: (NSIndexPath*)indexPath
{
	return nil;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"cellId";//@"用户名:"
    static NSString *cellId1 = @"cellId1";//@"姓名:"
    static NSString *cellId2 = @"cellId2";//@"QQ:"
    static NSString *cellId3 = @"cellId3";//@"邮箱:"
    static NSString *cellId4 = @"cellId4";//@"性别:"
    static NSString *cellId5 = @"cellId5";//@"注册时间:"
    static NSString *cellId6 = @"cellId6";//@"VIP等级:"
    static NSString *cellId7 = @"cellId7";//@"到期时间:"
    
    
    UITableViewCell *cell = nil;
    if(0 == indexPath.row)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                          reuseIdentifier: cellId] autorelease];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = @"用户名:";
        }
        
        if(_tf0)
        {
            _tf0.text = [[RCTool getUserInfo] objectForKey:@"username"];
            [cell addSubview:_tf0];
        }
    }
    else if(1 == indexPath.row)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId1];
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                           reuseIdentifier: cellId1] autorelease];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = @"姓名:";
        }
        
        if(_tf1)
        {
            _tf1.text = [[RCTool getUserInfo] objectForKey:@"name"];
            [cell addSubview:_tf1];
        }
    }
    else if(2 == indexPath.row)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId2];
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                           reuseIdentifier: cellId2] autorelease];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = @"QQ:";
        }
        
        if(_tf2)
        {
            _tf2.text = [[RCTool getUserInfo] objectForKey:@"qq"];
            [cell addSubview:_tf2];
        }
    }
    else if(3 == indexPath.row)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId3];
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                           reuseIdentifier: cellId3] autorelease];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = @"邮箱:";
        }
        
        if(_tf3)
        {
            _tf3.text = [[RCTool getUserInfo] objectForKey:@"email"];
            [cell addSubview:_tf3];
        }
    }
    else if(4 == indexPath.row)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId4];
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                           reuseIdentifier: cellId4] autorelease];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = @"性别:";
        }
        
        if(_tf4)
        {
            _tf4.text = [[RCTool getUserInfo] objectForKey:@"sex"];
            [cell addSubview:_tf4];
        }
    }
    else if(5 == indexPath.row)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId5];
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                           reuseIdentifier: cellId5] autorelease];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = @"注册时间:";
        }
        
        if(_tf5)
        {
            _tf5.text = [[RCTool getUserInfo] objectForKey:@"regdate"];
            [cell addSubview:_tf5];
        }
    }
    else if(6 == indexPath.row)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId6];
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                           reuseIdentifier: cellId6] autorelease];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = @"VIP等级:";
        }
        
        if(_tf6)
        {
            _tf6.text = [[RCTool getUserInfo] objectForKey:@"userlevelname"];
            [cell addSubview:_tf6];
        }
    }
    else if(7 == indexPath.row)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId7];
        if (cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                           reuseIdentifier: cellId7] autorelease];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            cell.textLabel.text = @"到期时间:";
        }
        
        if(_tf7)
        {
            _tf7.text = [[RCTool getUserInfo] objectForKey:@"vipexpire"];
            [cell addSubview:_tf7];
        }
    }


    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[tableView deselectRowAtIndexPath: indexPath animated: YES];
}

#pragma mark - UIKeyboardNotification Methods

- (void)keyboardWillShow:(NSNotification*)notification
{
    NSDictionary *userInfo = [notification userInfo];
	NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
	CGRect keyboardRect = [aValue CGRectValue];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         
                        self.tableView.frame = CGRectMake(0,0,[RCTool getScreenSize].width,[RCTool getScreenSize].height - STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT-keyboardRect.size.height);
                         
                     }completion:^(BOOL finished) {
                         
                     }];
}

- (void)keyboardWillHide:(NSNotification*)notification
{
    NSDictionary *userInfo = [notification userInfo];
	NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
	CGRect keyboardRect = [aValue CGRectValue];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         
                         self.tableView.frame = CGRectMake(0,0,[RCTool getScreenSize].width,[RCTool getScreenSize].height - STATUS_BAR_HEIGHT);
                         
                     }completion:^(BOOL finished) {
                         
                     }];
    
}

@end
