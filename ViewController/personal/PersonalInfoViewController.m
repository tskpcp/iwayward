//
//  PersonalInfoViewController.m
//  iwayward
//
//  Created by caopeng on 15/3/15.
//  Copyright (c) 2015年 iwayward. All rights reserved.
//

#import "PersonalInfoViewController.h"
#define FirstComponent 0
#define SubComponent 1
#define ThirdComponent 2

@interface PersonalInfoViewController ()
@property(nonatomic,strong)NSDictionary* dict;
@property(nonatomic,strong)NSArray* pickerArray;
@property(nonatomic,strong)NSArray* subPickerArray;
@property(nonatomic,strong)NSArray* thirdPickerArray;
@property(nonatomic,strong)NSArray* selectArray;

@end

@implementation PersonalInfoViewController
@synthesize dict=_dict;
@synthesize pickerArray=_pickerArray;
@synthesize subPickerArray=_subPickerArray;
@synthesize thirdPickerArray=_thirdPickerArray;
@synthesize selectArray=_selectArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=VIEW_BG_COLOR;
    self.title=@"我的信息";
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]init];
    barBtn.title=@"保存";
    self.navigationItem.rightBarButtonItem=barBtn;
  /*
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action: @selector(selectLeftAction:)];
    self.navigationItem.leftBarButtonItem = leftButton;
 */
    
    [self initUILayout];
    [self initDataSource];
}
-(void)selectLeftAction:(UIBarButtonItem *)sender{
    //开始动画
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:0.3];
    sv.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height);
    sv.contentSize = CGSizeMake(self.view.center.x,_SCREEN_HEIGHT1);
    //动画结束

    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initUILayout{
    
    sv=[[UIScrollView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height)];
    sv.showsVerticalScrollIndicator=YES;
    sv.showsHorizontalScrollIndicator=NO;
    sv.scrollEnabled=YES;
    sv.delegate = self;
    sv.alwaysBounceVertical=YES;
    sv.layer.borderWidth = 1;
    sv.layer.borderColor = [UIColor colorWithRed:176.0/255.0 green:176.0/255.0 blue:176.0/255.0 alpha:1].CGColor;
    sv.tag=3000;
    [self.view addSubview:sv];
    
    
   
    UILabel *lblHeadPortrait=[[UILabel alloc]initWithFrame:CGRectMake(10,20,75, 30)];
    lblHeadPortrait.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblHeadPortrait.font=[UIFont boldSystemFontOfSize:15];
    lblHeadPortrait.backgroundColor=[UIColor clearColor];
    lblHeadPortrait.text=@"头像";
    [sv addSubview:lblHeadPortrait];
    
    
    
    UILabel *lblline0=[[UILabel alloc]initWithFrame:CGRectMake(0, lblHeadPortrait.frame.origin.y+lblHeadPortrait.frame.size.height+10, self.view.bounds.size.width, 5)];
    lblline0.layer.borderWidth = 1;
    lblline0.layer.borderColor = LINE_COLOR;
    lblline0.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:lblline0];
   
   
  //==========================================
    UILabel *lblName=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline0.frame.origin.y+5,75, 30)];
    lblName.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblName.font=[UIFont boldSystemFontOfSize:15];
    lblName.backgroundColor=[UIColor clearColor];
    lblName.text=@"姓   名:";
    [sv addSubview:lblName];
    
    txtName=[[UITextField alloc]initWithFrame:CGRectMake(lblName.frame.origin.x+lblName.frame.size.width, lblline0.frame.origin.y+5, 200, 30)];
    txtName.font=[UIFont boldSystemFontOfSize:14];
    txtName.backgroundColor=[UIColor clearColor];
    txtName.tag=100;
    txtName.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtName.delegate=self;
    txtName.keyboardType=UIKeyboardAppearanceDefault;
    txtName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtName.adjustsFontSizeToFitWidth = YES;
    txtName.placeholder=@"请输姓名";
    [sv addSubview:txtName];
    

   
    UILabel *lblline1=[[UILabel alloc]initWithFrame:CGRectMake(0, lblName.frame.origin.y+lblName.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline1.layer.borderWidth = 1;
    lblline1.layer.borderColor = LINE_COLOR;
    lblline1.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:lblline1];
    //==========================================
    UILabel *lblNickName=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline1.frame.origin.y+5,75, 30)];
    lblNickName.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblNickName.font=[UIFont boldSystemFontOfSize:15];
    lblNickName.backgroundColor=[UIColor clearColor];
    lblNickName.text=@"昵   称:";
    [sv addSubview:lblNickName];
    
    txtRickName=[[UITextField alloc]initWithFrame:CGRectMake(lblNickName.frame.origin.x+lblNickName.frame.size.width, lblline1.frame.origin.y+5, 200, 30)];
    txtRickName.font=[UIFont boldSystemFontOfSize:14];
    txtRickName.backgroundColor=[UIColor clearColor];
    txtRickName.tag=200;
    txtRickName.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtRickName.delegate=self;
    txtRickName.keyboardType=UIKeyboardAppearanceDefault;
    txtRickName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtRickName.adjustsFontSizeToFitWidth = YES;
    txtRickName.placeholder=@"请输昵称";
    [sv addSubview:txtRickName];

    
    UILabel *lblline2=[[UILabel alloc]initWithFrame:CGRectMake(0, lblNickName.frame.origin.y+lblNickName.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline2.layer.borderWidth = 1;
    lblline2.layer.borderColor = LINE_COLOR;
    lblline2.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:lblline2];
    
   
    //==========================================
    UILabel *lblGender=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline2.frame.origin.y+5,75, 30)];
    lblGender.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblGender.font=[UIFont boldSystemFontOfSize:15];
    lblGender.backgroundColor=[UIColor clearColor];
    lblGender.text=@"性   别:";
    [sv addSubview:lblGender];
    
    swGender =[[ZJSwitch alloc] initWithFrame:CGRectMake(lblGender.frame.origin.x+lblGender.frame.size.width, lblline2.frame.origin.y+6, 80, 30)];
    swGender.backgroundColor = [UIColor clearColor];
    swGender.tintColor = [UIColor orangeColor];
    swGender.tag=1002;
    swGender.on=YES;
    swGender.onText = @"男";
    swGender.offText = @"女";
    [swGender addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [sv addSubview:swGender];



    UILabel *lblline4=[[UILabel alloc]initWithFrame:CGRectMake(0, lblGender.frame.origin.y+lblGender.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline4.layer.borderWidth = 1;
    lblline4.layer.borderColor = LINE_COLOR;
    lblline4.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:lblline4];
    
    
    //==========================================
    UILabel *lblAge=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline4.frame.origin.y+5,75, 30)];
    lblAge.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblAge.font=[UIFont boldSystemFontOfSize:15];
    lblAge.backgroundColor=[UIColor clearColor];
    lblAge.text=@"年   龄:";
    [sv addSubview:lblAge];
    
    txtAge=[[UITextField alloc]initWithFrame:CGRectMake(lblAge.frame.origin.x+lblAge.frame.size.width, lblline4.frame.origin.y+5, 200, 30)];
    txtAge.font=[UIFont boldSystemFontOfSize:14];
    txtAge.backgroundColor=[UIColor clearColor];
    txtAge.tag=400;
    txtAge.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtAge.delegate=self;
    txtAge.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtAge.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    txtAge.adjustsFontSizeToFitWidth = YES;
    txtAge.placeholder=@"请输年龄";
    [sv addSubview:txtAge];
    


    
    UILabel *lblline5=[[UILabel alloc]initWithFrame:CGRectMake(0, lblAge.frame.origin.y+lblAge.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline5.layer.borderWidth = 1;
    lblline5.layer.borderColor = LINE_COLOR;
    lblline5.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:lblline5];

    //==========================================
    UIView *AddressView=[[UIView alloc]initWithFrame:CGRectMake(0, lblline5.frame.origin.y+lblline5.frame.size.height, self.view.bounds.size.width, 45)];
    AddressView.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:AddressView];
    
    UILabel *lblAddress=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline5.frame.origin.y+lblline5.frame.size.height+5,75, 30)];
    lblAddress.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblAddress.font=[UIFont boldSystemFontOfSize:15];
    lblAddress.backgroundColor=[UIColor clearColor];
    lblAddress.text=@"联系方式";
    [sv addSubview:lblAddress];
    
    //==========================================
    UILabel *lblContactTelephoneNumber=[[UILabel alloc]initWithFrame:CGRectMake(10,AddressView.frame.origin.y+AddressView.frame.size.height+5,75, 30)];
    lblContactTelephoneNumber.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblContactTelephoneNumber.font=[UIFont boldSystemFontOfSize:15];
    lblContactTelephoneNumber.backgroundColor=[UIColor clearColor];
    lblContactTelephoneNumber.text=@"联系电话:";
    [sv addSubview:lblContactTelephoneNumber];
    
    
    txtContactTelephoneNumber=[[UITextField alloc]initWithFrame:CGRectMake(lblContactTelephoneNumber.frame.origin.x+lblContactTelephoneNumber.frame.size.width, AddressView.frame.origin.y+AddressView.frame.size.height+5, 200, 30)];
    txtContactTelephoneNumber.font=[UIFont boldSystemFontOfSize:14];
    txtContactTelephoneNumber.backgroundColor=[UIColor clearColor];
    txtContactTelephoneNumber.tag=600;
    txtContactTelephoneNumber.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtContactTelephoneNumber.delegate=self;
    txtContactTelephoneNumber.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtContactTelephoneNumber.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    txtContactTelephoneNumber.adjustsFontSizeToFitWidth = YES;
    txtContactTelephoneNumber.placeholder=@"请输联系电话";
    [sv addSubview:txtContactTelephoneNumber];
    
    
    
    
    UILabel *lblline7=[[UILabel alloc]initWithFrame:CGRectMake(0, lblContactTelephoneNumber.frame.origin.y+lblContactTelephoneNumber.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline7.layer.borderWidth = 1;
    lblline7.layer.borderColor = LINE_COLOR;
    lblline7.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:lblline7];
    
    
    //==========================================
    UILabel *lblMailbox=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline7.frame.origin.y+5,75, 30)];
    lblMailbox.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblMailbox.font=[UIFont boldSystemFontOfSize:15];
    lblMailbox.backgroundColor=[UIColor clearColor];
    lblMailbox.text=@"邮    箱:";
    [sv addSubview:lblMailbox];
    
    
    txtMailbox=[[UITextField alloc]initWithFrame:CGRectMake(lblMailbox.frame.origin.x+lblMailbox.frame.size.width, lblline7.frame.origin.y+5, 200, 30)];
    txtMailbox.font=[UIFont boldSystemFontOfSize:14];
    txtMailbox.backgroundColor=[UIColor clearColor];
    txtMailbox.tag=700;
    txtMailbox.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtMailbox.delegate=self;
    txtMailbox.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtMailbox.keyboardType=UIKeyboardAppearanceDefault;
    txtMailbox.adjustsFontSizeToFitWidth = YES;
    txtMailbox.placeholder=@"请输邮箱";
    [sv addSubview:txtMailbox];
    
    
    
    
    UILabel *lblline8=[[UILabel alloc]initWithFrame:CGRectMake(0, lblMailbox.frame.origin.y+lblMailbox.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline8.layer.borderWidth = 1;
    lblline8.layer.borderColor = LINE_COLOR;
    lblline8.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:lblline8];

  
    //==========================================
    UILabel *lblProvince=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline8.frame.origin.y+5,75, 30)];
    lblProvince.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblProvince.font=[UIFont boldSystemFontOfSize:15];
    lblProvince.backgroundColor=[UIColor clearColor];
    lblProvince.text=@"省/市/区:";
    [sv addSubview:lblProvince];
    
   
    cityPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 216)];
    cityPicker.dataSource = self;
    cityPicker.delegate = self;
    cityPicker.showsSelectionIndicator = YES;      // 这个弄成YES, picker中间就会有个条, 被选中的样子
    cityPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    cityPicker.backgroundColor=[UIColor whiteColor];
    cityPicker.tag=888;
   //数据加载
    NSString* plistPath=[[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"];
    _dict=[[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    self.pickerArray=[_dict allKeys];
    
    self.selectArray=[_dict objectForKey:[[_dict allKeys] objectAtIndex:0]];
    
    if ([_selectArray count]>0) {
        self.subPickerArray= [[self.selectArray objectAtIndex:0] allKeys];
    }
    if ([_subPickerArray count]>0) {
        self.thirdPickerArray=[[self.selectArray objectAtIndex:0] objectForKey:[self.subPickerArray objectAtIndex:0]];
    }
   //确认工具按钮设置
    cityFexibleSpace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIToolbar *cityToolBarData=[[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 40)];
    NSMutableArray *cityBtnArrayData=[[NSMutableArray alloc]init];
    //ios7.0
    //UIBarButtonItem *itemBarBtnData=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleBordered target:self action:@selector(PickerSelect:)];
    UIBarButtonItem *cityItemBarBtnData=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(PickerSelect:)];
    cityItemBarBtnData.tag=51008;
    [cityBtnArrayData addObject:cityFexibleSpace];
    [cityBtnArrayData addObject:cityItemBarBtnData];
    [cityToolBarData setItems:cityBtnArrayData animated:YES];
    
    txtProvince=[[UITextField alloc]initWithFrame:CGRectMake(lblProvince.frame.origin.x+lblProvince.frame.size.width,lblline8.frame.origin.y+5, self.view.bounds.size.width-(lblProvince.frame.origin.x+lblProvince.frame.size.width)-10, 30)];
    txtProvince.font=[UIFont boldSystemFontOfSize:14];
    txtProvince.backgroundColor=[UIColor clearColor];
    txtProvince.tag=800;
    txtProvince.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtProvince.delegate=self;
    txtProvince.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtProvince.keyboardType=UIKeyboardAppearanceDefault;
    txtProvince.adjustsFontSizeToFitWidth = YES;
    txtProvince.placeholder=@"请输入省市地区";
    txtProvince.inputView=cityPicker;
    txtProvince.inputAccessoryView=cityToolBarData;
    [sv addSubview:txtProvince];
    
    UILabel *lblline9=[[UILabel alloc]initWithFrame:CGRectMake(0, lblProvince.frame.origin.y+lblProvince.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline9.layer.borderWidth = 1;
    lblline9.layer.borderColor = LINE_COLOR;
    lblline9.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:lblline9];
    
    //==========================================
    UILabel *lblArea=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline9.frame.origin.y+5,75, 30)];
    lblArea.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblArea.font=[UIFont boldSystemFontOfSize:15];
    lblArea.backgroundColor=[UIColor clearColor];
    lblArea.text=@"详细地址:";
    [sv addSubview:lblArea];
    
    
    txtArea=[[UITextField alloc]initWithFrame:CGRectMake(lblArea.frame.origin.x+lblArea.frame.size.width, lblline9.frame.origin.y+5, self.view.bounds.size.width-(lblArea.frame.origin.x+lblArea.frame.size.width)-10, 30)];
    txtArea.font=[UIFont boldSystemFontOfSize:14];
    txtArea.backgroundColor=[UIColor clearColor];
    txtArea.tag=900;
    txtArea.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtArea.delegate=self;
    txtArea.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtArea.keyboardType=UIKeyboardAppearanceDefault;
    txtArea.adjustsFontSizeToFitWidth = YES;
    txtArea.placeholder=@"请输入详细地址";
    [sv addSubview:txtArea];
    
    UILabel *lblline11=[[UILabel alloc]initWithFrame:CGRectMake(0, lblArea.frame.origin.y+lblArea.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline11.layer.borderWidth = 1;
    lblline11.layer.borderColor = LINE_COLOR;
    lblline11.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:lblline11];
    
   
   
   
   //=========================

    
    UIView *IdentityInformationView=[[UIView alloc]initWithFrame:CGRectMake(0, lblline11.frame.origin.y+lblline11.frame.size.height, self.view.bounds.size.width, 45)];
    IdentityInformationView.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:IdentityInformationView];
    
    UILabel *lblIdentityInformation=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline11.frame.origin.y+lblline11.frame.size.height+5,120, 30)];
    lblIdentityInformation.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblIdentityInformation.font=[UIFont boldSystemFontOfSize:15];
    lblIdentityInformation.backgroundColor=[UIColor clearColor];
    lblIdentityInformation.text=@"身份信息";
    [sv addSubview:lblIdentityInformation];

     //==========================================
    
    UILabel *lblEducation=[[UILabel alloc]initWithFrame:CGRectMake(10,IdentityInformationView.frame.origin.y+IdentityInformationView.frame.size.height+8, 75, 25)];
    lblEducation.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblEducation.font=[UIFont boldSystemFontOfSize:15];
    lblEducation.backgroundColor=[UIColor clearColor];
    lblEducation.text=@"学   历:";
    [sv addSubview:lblEducation];
    
    lblEducationText=[[UILabel alloc]initWithFrame:CGRectMake(lblEducation.frame.origin.x+lblEducation.frame.size.width+2,IdentityInformationView.frame.origin.y+IdentityInformationView.frame.size.height+8, 75, 25)];
    lblEducationText.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblEducationText.font=[UIFont boldSystemFontOfSize:15];
    lblEducationText.backgroundColor=[UIColor clearColor];
        [sv addSubview:lblEducationText];

    
    UIImageView *imageEducation=[[UIImageView alloc]initWithFrame:CGRectMake(sv.frame.size.width-30,IdentityInformationView.frame.origin.y+IdentityInformationView.frame.size.height+8, 25, 25)];
    [imageEducation setImage:[UIImage imageNamed:@"u51"]];
    [sv addSubview:imageEducation];
    
    UIButton *btnEducation=[[UIButton alloc] initWithFrame:CGRectMake(0,IdentityInformationView.frame.origin.y+IdentityInformationView.frame.size.height+8,sv.frame.size.width, 35)];
    btnEducation.tag=10003;
    [btnEducation addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnEducation setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnEducation.backgroundColor=[UIColor clearColor];
    [sv addSubview:btnEducation];
    
    
        UILabel *lblline21=[[UILabel alloc]initWithFrame:CGRectMake(0, lblEducation.frame.origin.y+lblEducation.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline21.layer.borderWidth = 1;
    lblline21.layer.borderColor = LINE_COLOR;
    lblline21.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:lblline21];
//==========================================================================================
    
   
    
    
    UILabel *lblIndustry=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline21.frame.origin.y+lblline21.frame.size.height+5,75, 30)];
    lblIndustry.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblIndustry.font=[UIFont boldSystemFontOfSize:15];
    lblIndustry.backgroundColor=[UIColor clearColor];
    lblIndustry.text=@"行   业:";
    [sv addSubview:lblIndustry];
    
    UIImageView *imageIndustry=[[UIImageView alloc]initWithFrame:CGRectMake(sv.frame.size.width-30,lblline21.frame.origin.y+lblline21.frame.size.height+8, 25, 25)];
    [imageIndustry setImage:[UIImage imageNamed:@"u51"]];
    [sv addSubview:imageIndustry];
    
    UIButton *btnIndustry=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline21.frame.origin.y+lblline21.frame.size.height+5,sv.frame.size.width, 35)];
    btnIndustry.tag=10001;
    [btnIndustry addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnIndustry setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnIndustry.backgroundColor=[UIColor clearColor];
    [sv addSubview:btnIndustry];
    
    
    UILabel *lblline18=[[UILabel alloc]initWithFrame:CGRectMake(0, lblIndustry.frame.origin.y+lblIndustry.frame.size.height+5, self.view.bounds.size.width, 1)];
    lblline18.layer.borderWidth = 1;
    lblline18.layer.borderColor = LINE_COLOR;
    lblline18.backgroundColor=LINE_BG_COLOR;
    [sv addSubview:lblline18];
     //==========================================
    UILabel *lblPosition=[[UILabel alloc]initWithFrame:CGRectMake(10,lblline18.frame.origin.y+lblline18.frame.size.height+5,75, 30)];
    lblPosition.textColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    lblPosition.font=[UIFont boldSystemFontOfSize:15];
    lblPosition.backgroundColor=[UIColor clearColor];
    lblPosition.text=@"职   位:";
    [sv addSubview:lblPosition];
    
    UIImageView *imagePosition=[[UIImageView alloc]initWithFrame:CGRectMake(sv.frame.size.width-30,lblline18.frame.origin.y+lblline18.frame.size.height+8, 25, 25)];
    [imagePosition setImage:[UIImage imageNamed:@"u51"]];
    [sv addSubview:imagePosition];
    
    UIButton *btnPosition=[[UIButton alloc] initWithFrame:CGRectMake(0,lblline18.frame.origin.y+lblline18.frame.size.height+5,sv.frame.size.width, 35)];
    btnPosition.tag=10002;
    [btnPosition addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btnPosition setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnPosition.backgroundColor=[UIColor clearColor];
    [sv addSubview:btnPosition];
    
    
    CGSize newSize = CGSizeMake(self.view.frame.size.width, lblPosition.frame.origin.y+lblPosition.frame.size.height+5+1);
    _SCREEN_HEIGHT1=lblPosition.frame.origin.y+lblPosition.frame.size.height+5+1;
    NSLog(@"i=%f",_SCREEN_HEIGHT1);
    [sv setContentSize:newSize];
 
}
-(void)initDataSource{
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(educationData:)
                                                 name: @"educationData"
                                               object: nil];

}
-(void)educationData:(NSNotification *)readArray{
    lblEducationText.text=[readArray object];

}
-(void)PickerSelect:(UIBarButtonItem *)sender{
    switch (sender.tag) {
        
      
        case 51008:{
           
            proviceStr=[self.pickerArray objectAtIndex:intProvice];
            cityStr=[self.subPickerArray objectAtIndex:intCity];
            regionStr=[self.thirdPickerArray objectAtIndex:intRegion];

            //NSLog(@"%@%@%@",proviceStr,cityStr,regionStr);
            NSString *tempStr=[[NSString alloc]init];
            NSString *tempStr1=[[NSString alloc]init];
            if([proviceStr isEqualToString:cityStr]){
                tempStr=proviceStr;
            }
            else{
              tempStr=[tempStr stringByAppendingFormat:@"%@%@",proviceStr, cityStr];
            }
            tempStr1=[tempStr1 stringByAppendingFormat:@"%@%@",tempStr, regionStr];
            // NSLog(@"tempStr=%@",tempStr1);
             txtProvince.text=tempStr1;
            [txtProvince endEditing:YES];

            //开始动画
            [UIView beginAnimations:nil context:nil];
            //设定动画持续时间
            [UIView setAnimationDuration:0.3];
            sv.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height);
            sv.contentSize = CGSizeMake(self.view.center.x,_SCREEN_HEIGHT1);
            //动画结束
            [UIView commitAnimations];
            
            break;
        }
        default:
            break;
    }
    
}
#pragma mark UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    if(pickerView.tag==888){
        if (component==FirstComponent) {
            return [self.pickerArray objectAtIndex:row];
        }
        if (component==SubComponent) {
            return [self.subPickerArray objectAtIndex:row];
        }
        if (component==ThirdComponent) {
            return [self.thirdPickerArray objectAtIndex:row];
        }
        return nil;
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
     if(pickerView.tag==888){
         //NSLog(@"row is %ld,Component is %ld",row,component);
         if (component==0) {
             self.selectArray=[_dict objectForKey:[self.pickerArray objectAtIndex:row]];
             if ([self.selectArray count]>0) {
                 self.subPickerArray= [[self.selectArray objectAtIndex:0] allKeys];
             }else{
                 self.subPickerArray=nil;
             }
             if ([self.subPickerArray count]>0) {
                 self.thirdPickerArray=[[self.selectArray objectAtIndex:0] objectForKey:[self.subPickerArray objectAtIndex:0]];
             }else{
                 self.thirdPickerArray=nil;
             }
             [pickerView selectedRowInComponent:1];
             [pickerView reloadComponent:1];
             [pickerView selectedRowInComponent:2];
            
         }
         if (component==1) {
             if ([_selectArray count]>0&&[_subPickerArray count]>0) {
                 self.thirdPickerArray=[[self.selectArray objectAtIndex:0] objectForKey:[self.subPickerArray objectAtIndex:row]];
             }else{
                 self.thirdPickerArray=nil;
             }
             [pickerView selectRow:0 inComponent:2 animated:YES];
                          
         }
         [pickerView reloadComponent:2];
         
         if(component==FirstComponent){
             intProvice=row;
             intCity=0;
             intRegion=0;
             
         }
         if(component==SubComponent){
             intCity=row;
             intRegion=0;
         }
         if(component==ThirdComponent){
             intRegion=row;
         }
       
     }
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if(pickerView.tag==888){
        
        if (component==FirstComponent) {
            return 90.0;
        }
        if (component==SubComponent) {
            return 150.0;
        }
        if (component==ThirdComponent) {
            return 90.0;
        }
    }

    return 0;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    
    UILabel *myView = nil;
    
    if (component == FirstComponent) {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 30)];
        
        myView.textAlignment = UITextAlignmentLeft;
        
        myView.text = [self.pickerArray objectAtIndex:row];
        
        myView.font = [UIFont systemFontOfSize:14];         //用label来设置字体大小
        
        myView.backgroundColor = [UIColor clearColor];
        
    }
    if (component == SubComponent) {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 30)];
        
        myView.textAlignment = UITextAlignmentLeft;
        
        myView.text = [self.subPickerArray objectAtIndex:row];
        
        myView.font = [UIFont systemFontOfSize:14];         //用label来设置字体大小
        
        myView.backgroundColor = [UIColor clearColor];
        
    }
    if (component == ThirdComponent) {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 30)];
        
        myView.textAlignment = UITextAlignmentLeft;
        
        myView.text = [self.thirdPickerArray objectAtIndex:row];
        
        myView.font = [UIFont systemFontOfSize:14];         //用label来设置字体大小
        
        myView.backgroundColor = [UIColor clearColor];
        
    }
    return myView;
    
}
#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
   if(pickerView.tag==888){
        return 3;
    }
    return 0;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
     if(pickerView.tag==888){
         if (component==FirstComponent) {
             return [self.pickerArray count];
         }
         if (component==SubComponent) {
             return [self.subPickerArray count];
         }
         if (component==ThirdComponent) {
             return [self.thirdPickerArray count];
         }

     }
    return 0;
}
#pragma mark -
#pragma mark ScrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.tag==3000){
        [sv setContentOffset:scrollView.contentOffset];
    }
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(scrollView.tag==3000){
        [sv setContentOffset:scrollView.contentOffset];
    }
}
#pragma mark -
#pragma mark UITextViewDelegate
// became first responder
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    switch (textField.tag) {
        case 800:{
            sv.contentSize = CGSizeMake(self.view.center.x,150);//原始滑动距离增加键盘高度
          
            [sv setContentOffset:CGPointMake(0, 50) animated:YES];
            break;
        }
        case 700:{
            sv.contentSize = CGSizeMake(self.view.center.x,150);//原始滑动距离增加键盘高度
            [sv setContentOffset:CGPointMake(0, 50) animated:YES];
            break;
            
        }
        case 900:{
            sv.contentSize = CGSizeMake(self.view.center.x,150);//原始滑动距离增加键盘高度
            
            [sv setContentOffset:CGPointMake(0, 60) animated:YES];
            break;
        }
                default:
            break;
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    switch (textField.tag) {
        
        case 600:{
                }break;
        default:{
            
        } break;
    }
    
    
    
}

// called when 'return' key pressed. return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
     [textField resignFirstResponder];
    switch (textField.tag) {
        
        case 700:{
            [textField resignFirstResponder];
            //开始动画
            [UIView beginAnimations:nil context:nil];
            //设定动画持续时间
            [UIView setAnimationDuration:0.3];
            sv.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height);
            sv.contentSize = CGSizeMake(self.view.center.x,_SCREEN_HEIGHT1);
            //动画结束
            [UIView commitAnimations];
            
           break;
        }
        case 900:{
            [textField resignFirstResponder];
            //开始动画
            [UIView beginAnimations:nil context:nil];
            //设定动画持续时间
            [UIView setAnimationDuration:0.3];
            sv.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height);
            sv.contentSize = CGSizeMake(self.view.center.x,_SCREEN_HEIGHT1);
            //动画结束
            [UIView commitAnimations];
            
            break;
        }

        default:
            break;
    }
    return YES;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
   
    switch (textField.tag) {
        case 400:{
           
            //年龄只允许输入数字
            NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(!basicTest)
            {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                message:@"请输入数字"
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
                
                [alert show];
                
                return NO;
            }
            break;
         }
        case 600:{
           
            //电话号码验证
            NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(!basicTest)
            {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                message:@"请正确输入电话号码"
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
                
                [alert show];
                
                return NO;
            }else{
            
                //电话号码验证
                if (range.location == 13) {
                    return NO;
                }else if (range.location == 8){
                    
                    NSMutableString *str = [[NSMutableString alloc] initWithString:txtContactTelephoneNumber.text];
                    NSRange range = [str rangeOfString:@"-"];
                    if (range.location!=NSNotFound)
                    {
                        
                    }else {
                        [str insertString:@"-" atIndex:3];
                        [str insertString:@"-" atIndex:8];
                        txtContactTelephoneNumber.text = str;
                    }
                    return YES;
                }else if(range.location==9) {
                    NSMutableString *str = [[NSMutableString alloc] initWithString:txtContactTelephoneNumber.text];
                    NSString *str1;
                    str1 = [str stringByReplacingOccurrencesOfString:@"-"withString:@""];
                    txtContactTelephoneNumber.text = str1;
                    return YES;
                    
                }else
                {
                    return YES;
                }

            }
            
            break;
        }
        case 700:{
            
            break;
        }
        case 900:{
            //年龄只允许输入数字
            NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(!basicTest)
            {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                message:@"请正确输入QQ号"
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
                
                [alert show];
                
                return NO;
            }
            
            break;
        }
        default:
            break;
    }
            return  YES;
}
-(void)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 10001:{//行业
            UIBarButtonItem *IndustryViewbarBtn=[[UIBarButtonItem alloc]init];
            IndustryViewbarBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=IndustryViewbarBtn;
            IndustryViewController *IndustryView=[[IndustryViewController alloc]init];
            [self.navigationController pushViewController:IndustryView animated:YES];
            
            break;
        }
        case 10002:{//职位
            UIBarButtonItem *positionViewbarBtn=[[UIBarButtonItem alloc]init];
            positionViewbarBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=positionViewbarBtn;
            PositionViewController *positionView=[[PositionViewController alloc]init];
            [self.navigationController pushViewController:positionView animated:YES];
           
            
            break;
        }
        case 10003:{//学历
            UIBarButtonItem *educationViewbarBtn=[[UIBarButtonItem alloc]init];
            educationViewbarBtn.title=@"返回";
            self.navigationItem.backBarButtonItem=educationViewbarBtn;
            EducationViewController *educationView=[[EducationViewController alloc]init];
            [self.navigationController pushViewController:educationView animated:YES];
        }
        default:
            break;
    }
}
-(void)valueChanged:(id)sender{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
