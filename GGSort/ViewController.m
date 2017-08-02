//
//  ViewController.m
//  GGSort
//
//  Created by 陈刚 on 2017/8/2.
//
//

#import "ViewController.h"
#import "GGSort.h"
#import "CustomOneModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //数字数组排序示例
    NSArray *arr = @[@1,@3,@4534,@4,@3.5,@11.22];
    NSArray *newArr = [[GGSort sharedInstance] sortArrayWithArr:arr withSortCompareType:SortCompareUpType];
    NSLog(@"newArr = %@",newArr);
    
    
    //模型数组排序示例
    NSMutableArray *modelArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i<10; i++) {
        CustomOneModel *model = [[CustomOneModel alloc] init];
        model.score = arc4random()%100;
        model.height = (arc4random()%10000)*0.001;
        model.width = [NSString stringWithFormat:@"%u",arc4random()%100];
        [modelArr addObject:model];
    }

    //3
    NSArray *newModelArr = [[GGSort sharedInstance] sortArrayWithArr:modelArr withSortArrayType:SortArrayModelType withSortCompareType:SortCompareUpType withSortKeyWordName:@"width" withSortKeywordType:SortKeywordNumberType];
    
    for (CustomOneModel *model in newModelArr) {
        
        NSLog(@"\n   model%lu\n   score = %d  \n   height = %f\n   width = %@\n",(unsigned long)[newModelArr indexOfObject:model], model.score,model.height,model.width);
    }
    
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
