//
//  GGSort.h
//  GGSort
//
//  Created by 陈刚 on 2017/8/2.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(int, SortArrayType) {
    SortArrayNumberType   = 0,         //数字类型数组
    SortArrayModelType,                //对象类型数组
};

typedef NS_ENUM(int, SortCompareType) {
    SortCompareUpType   = 0,            //升序
    SortCompareDownType,                //降序
};

typedef NS_ENUM(int, SortKeywordType) {
    SortKeywordNumberType   = 0,         //数字类型属性  （如果属性值是字符串类型会自动转换为数字进行比较）
};




/*
 此工具目的在于进行数组中元素排序，目标是实现支持任何类型元素的数组排序
 1.目前支持元素：
    *数字类型元素（int/float/double等等）
    *对象模型类型元素 (按对象中数字类型属性排序)
 
 2.支持对象排序关键字类型：
    *数字类型属性
 */



@interface GGSort : NSObject

+ (instancetype)sharedInstance;


/*数字数组排序 （适合数字元素类型数组）*/
-(NSArray *)sortArrayWithArr:(NSArray *)array withSortCompareType:(SortCompareType)sortCompareType;

/*带类型元素数组排序  （适合非对象元素类型数组）*/
-(NSArray *)sortArrayWithArr:(NSArray *)array withSortArrayType:(SortArrayType)arrayType withSortCompareType:(SortCompareType)sortCompareType;


/**
 全数组排序方法 （适合所有类型数组）

 @param array        （必填）                   原始数组
 @param arrayType    （可选 默认数字类型数组）     数组类型            判断是纯数字元素数组 、对象元素数组
 @param sortCompareType    （可选 默认升序）     排序类型            升降序
 @param keyWordName  （对象类型数组必填）         对象元素数组时关键字元素名     根据关键字元素名判断对对象中哪个元素进行排序
 @param keyWordtype  （对象类型数组必填）         对象元素数组时关键字元素类型       根据关键字元素类型判断排序元素的属性值类型
 
 @return 排序后数组
 */

-(NSArray *)sortArrayWithArr:(NSArray *)array withSortArrayType:(SortArrayType)arrayType withSortCompareType:(SortCompareType)sortCompareType withSortKeyWordName:(NSString *)keyWordName withSortKeywordType:(SortKeywordType)keyWordtype;


@end
