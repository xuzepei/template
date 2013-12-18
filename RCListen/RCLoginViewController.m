//
//  RCLoginViewController.m
//  RCFang
//
//  Created by xuzepei on 3/14/13.
//  Copyright (c) 2013 xuzepei. All rights reserved.
//

#import "RCLoginViewController.h"
#import "RCTool.h"
#import "RCSignupViewController.h"
#import "RCHttpRequest.h"
#import "iToast.h"

#define ACCOUNT_TF_TAG 100
#define PASSWORD_TF_TAG 101
#define ATTRIBUTED_LABEL_TAG 102

@interface RCLoginViewController ()

@end

@implementation RCLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self setTitle:@"登录"];
        
    }
    return self;
}

- (void)dealloc
{
    self.tableView = nil;
    self.itemArray = nil;
    self.loginButton = nil;
    self.accountTF = nil;
    self.passwordTF = nil;
    self.attributedLabel = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [RCTool hideTabBar:YES];
    
    //添加自定义的返回按钮
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(-6,2, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(clickedBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem.titleView addSubview: backButton];
    
    [self initTableView];
    
    [self initButtons];
    
    [self initTextFields];
    
    [self initAttributedLabel];
}

- (void)clickedBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    [RCTool hideTabBar:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    self.tableView = nil;
    self.loginButton = nil;
    self.accountTF = nil;
    self.passwordTF = nil;
    self.attributedLabel = nil;
}

- (void)clickedRightBarButtonItem:(id)sender
{
    RCSignupViewController* temp = [[RCSignupViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:temp animated:YES];
    [temp release];
}

#pragma mark - UITableView

- (void)initTableView
{
    if(nil == _tableView)
    {
        if(nil == _itemArray)
            _itemArray = [[NSMutableArray alloc] init];
        


        //init table view
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,[RCTool getScreenSize].width,[RCTool getScreenSize].height - STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT)
                                                  style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.opaque = NO;
        _tableView.backgroundView = nil;
        _tableView.dataSource = self;
    }
	
	[self.view addSubview:_tableView];
    
    if(0 == [_itemArray count])
    {
        NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
        [dict setObject:@"账号：" forKey:@"name"];
        [_itemArray addObject:dict];
        [dict release];
        
        dict = [[NSMutableDictionary alloc] init];
        [dict setObject:@"密码：" forKey:@"name"];
        [_itemArray addObject:dict];
        [dict release];
    }
    
    [_tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(0 == section)
    {
        UIView* temp = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)] autorelease];
        temp.backgroundColor = [UIColor clearColor];
        UILabel* titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 40)] autorelease];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.numberOfLines = 2;
        titleLabel.text = @"登录时请用微信账号来登陆，登录后微信端的积分将同步到APP的积分系统中。";
        titleLabel.textColor = [UIColor orangeColor];
        titleLabel.font = [UIFont systemFontOfSize:14];
        [temp addSubview: titleLabel];
        
        return temp;
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (id)getCellDataAtIndexPath: (NSIndexPath*)indexPath
{
	if(indexPath.row >= [_itemArray count])
		return nil;
	
	return [_itemArray objectAtIndex: indexPath.row];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_itemArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44.0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"cellId";
    static NSString *cellId1 = @"cellId1";
    
    UITableViewCell *cell = nil;
    
    if(0 == indexPath.row)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if(cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                           reuseIdentifier: cellId] autorelease];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            [cell addSubview:_accountTF];
        }
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellId1];
        if(cell == nil)
        {
            cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                           reuseIdentifier: cellId1] autorelease];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell addSubview:_passwordTF];
        }
    }
	
    
    NSDictionary* item = (NSDictionary*)[self getCellDataAtIndexPath: indexPath];
	if(item)
	{
        cell.textLabel.text = [item objectForKey:@"name"];
	}
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[tableView deselectRowAtIndexPath: indexPath animated: YES];
}

#pragma mark Buttons

- (void)initButtons
{
    if(nil == _loginButton)
    {
        self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(15, 200, 290, 48);
//        _loginButton.titleLabel.font = [UIFont systemFontOfSize:16];
//        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"login_button"] forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //[_searchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [_loginButton addTarget:self action:@selector(clickedLoginButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.tableView addSubview: _loginButton];
    }
    
}

- (void)clickedLoginButton:(id)sender
{
    NSLog(@"clickedLoginButton");
    
    if(0 == [_accountTF.text length])
    {
        [RCTool showAlert:@"提示" message:@"请输入微信账号！"];
        return;
    }
    
    if(0 == [_passwordTF.text length])
    {
        [RCTool showAlert:@"提示" message:@"请输入密码！"];
        return;
    }
    
    
    NSString* urlString = [NSString stringWithFormat:@"%@/user_login.php?apiid=%@&pwd=%@",BASE_URL,APIID,PWD];
    
    NSString* token = [NSString stringWithFormat:@"username=%@&password=%@",_accountTF.text,_passwordTF.text];
    
    RCHttpRequest* temp = [[[RCHttpRequest alloc] init] autorelease];
    BOOL b = [temp post:urlString delegate:self resultSelector:@selector(finishedPostRequest:) token:token];
    if(b)
    {
        [RCTool showIndicator:@"请稍候..."];
    }
}

- (void)finishedPostRequest:(NSString*)jsonString
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
            NSString* username = [result objectForKey:@"username"];
            if([username length])
            {
                [RCTool setUsername:username];
            }
            
            NSString* password = [result objectForKey:@"password"];
            if([password length])
            {
                [RCTool setPassword:password];
                
                [[iToast makeText:[NSString stringWithFormat:@"欢迎:%@用户登录",username]] show];
                
                [self.navigationController popToRootViewControllerAnimated:YES];
                
                //[RCTool showAlert:@"提示" message:@"登录成功！"];
            }
            
            return;
        }
        else
            [RCTool showAlert:@"提示" message:error];
        
        return;
    }
    
    [RCTool showAlert:@"提示" message:@"登录失败，请检查网络，稍后尝试！"];
}

#pragma mark - TextField

- (void)initTextFields
{
    if(nil == _accountTF)
    {
        _accountTF = [[UITextField alloc] initWithFrame:CGRectMake(80, 8, 200, 30)];
        _accountTF.delegate = self;
        _accountTF.tag = ACCOUNT_TF_TAG;
        _accountTF.placeholder = @"微信账号";
        _accountTF.returnKeyType = UIReturnKeyDone;
        _accountTF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    }
    
    if(nil == _passwordTF)
    {
        _passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(80, 8, 200, 30)];
        _passwordTF.delegate = self;
        _passwordTF.tag = PASSWORD_TF_TAG;
        _passwordTF.placeholder = @"密码";
        _passwordTF.secureTextEntry = YES;
        _passwordTF.returnKeyType = UIReturnKeyDone;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(ACCOUNT_TF_TAG == textField.tag)
    {
        [_passwordTF becomeFirstResponder];
        
        return NO;
    }
    else if(PASSWORD_TF_TAG == textField.tag)
    {
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
//    if(ACCOUNT_TF_TAG == textField.tag)
//    {
//        NSString* numbers = @"0123456789+-";
//        NSCharacterSet* cs = [[NSCharacterSet characterSetWithCharactersInString:numbers] invertedSet];
//        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
//        BOOL b = [string isEqualToString:filtered];
//        if(!b)
//        {
//            return NO;
//        }
//    }
    
    return YES;
}


#pragma mark - OHAttributedLabel

- (void)initAttributedLabel
{
    if(nil == _attributedLabel)
    {
        _attributedLabel = [[OHAttributedLabel alloc] initWithFrame:CGRectZero];
        _attributedLabel.tag = ATTRIBUTED_LABEL_TAG;
        _attributedLabel.frame = CGRectMake([RCTool getScreenSize].width - 70, [RCTool getScreenSize].height - STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT - 260, 200, 20);
        _attributedLabel.underlineLinks = YES;
        _attributedLabel.lineBreakMode =
        UILineBreakModeWordWrap;
        _attributedLabel.backgroundColor = [UIColor clearColor];
        _attributedLabel.delegate = self;
        NSString* text = @"忘记密码?";
        NSMutableAttributedString* attrStr = [NSMutableAttributedString attributedStringWithString:text];
        [_attributedLabel setFont:[UIFont systemFontOfSize:16]];
        _attributedLabel.attributedText = attrStr;
        [_attributedLabel addCustomLink:[NSURL URLWithString:text] inRange:NSMakeRange(0, [text length])];
        _attributedLabel.hidden = YES;
    }
    
    [self.tableView addSubview: _attributedLabel];
}

- (void)clickLinkText:(NSString*)linkText token:(id)token
{
    NSLog(@"clickLinkText:%@",linkText);
    
    if(ATTRIBUTED_LABEL_TAG == _attributedLabel.tag)
    {
        
    }
}

- (UIColor*)colorForLink:(NSTextCheckingResult*)linkInfo underlineStyle:(int32_t*)underlineStyle
{
    return [UIColor blueColor];
}

- (UIFont*)fontForLink:(id)token
{
	return [UIFont systemFontOfSize:12];
}


@end
