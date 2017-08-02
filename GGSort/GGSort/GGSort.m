//
//  GGSort.m
//  GGSort
//
//  Created by 陈刚 on 2017/8/2.
//
//

#import "GGSort.h"

@implementation GGSort

+(instancetype)sharedInstance
{
    static GGSort *instance;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[GGSort alloc] init];
        
    });
    
    return instance;
}


//1
-(NSArray *)sortArrayWithArr:(NSArray *)array withSortCompareType:(SortCompareType)sortCompareType
{
    
    return [self sortArrayWithArr:array withSortArrayType:SortArrayNumberType withSortCompareType:sortCompareType withSortKeyWordName:nil withSortKeywordType:SortKeywordNumberType];
    
}



//2
-(NSArray *)sortArrayWithArr:(NSArray *)array withSortArrayType:(SortArrayType)arrayType withSortCompareType:(SortCompareType)sortCompareType
{
    
    
    return [self sortArrayWithArr:array withSortArrayType:arrayType withSortCompareType:sortCompareType withSortKeyWordName:nil withSortKeywordType:SortKeywordNumberType];
    
    
}



//N
-(NSArray *)sortArrayWithArr:(NSArray *)array withSortArrayType:(SortArrayType)arrayType withSortCompareType:(SortCompareType)sortCompareType withSortKeyWordName:(NSString *)keyWordName withSortKeywordType:(SortKeywordType)keyWordtype
{
    
    if (array) {
        
        switch (arrayType) {
                
            case SortArrayNumberType:  //数字类型数组
            {
             
                return  [self sortArrayWithNumberArr:array withSortCompareType:sortCompareType];
                break;
            }
                
            case SortArrayModelType:   //对象类型数组
            {
                return [self sortArrayWithObjArr:array withSortCompareType:sortCompareType withSortKeyWordName:keyWordName withSortKeywordType:keyWordtype];
                break;
            }
            default:   //默认数字类型元素数组
            {
                return [self sortArrayWithNumberArr:array withSortCompareType:sortCompareType];
                break;
            }
        }
        
    }
    else
    {
        return array;
    }
    
    
    return array;
}



-(NSArray *)sortArrayWithNumberArr:(NSArray *)array withSortCompareType:(SortCompareType)sortCompareType
{
    //对数组进行排序
    
    NSArray *result = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        
        if (sortCompareType == SortCompareDownType) {
            
            return [obj2 compare:obj1]; //降序
            
        }
        else{
            
            return [obj1 compare:obj2]; //升序
            
        }
        
    }];
    return result;
}



-(NSArray *)sortArrayWithObjArr:(NSArray *)array withSortCompareType:(SortCompareType)sortCompareType withSortKeyWordName:(NSString *)keyWordName withSortKeywordType:(SortKeywordType)keyWordtype
{
    
    if (keyWordName&&keyWordName.length>0) {
        
        switch (keyWordtype) {
                
            case SortKeywordNumberType:
            {
                return [self sortArrayForNumberWithObjArr:array withSortCompareType:sortCompareType withSortKeyWordName:keyWordName];
                break;
            }
                
            default:
            {
                
                return array;
                break;
            }
        }
        
    }
    else
    {
        return array;
    }
    
    return array;
}



-(NSArray *)sortArrayForNumberWithObjArr:(NSArray *)array withSortCompareType:(SortCompareType)sortCompareType withSortKeyWordName:(NSString *)keyWordName
{
    //对数组进行排序
    
    NSArray *result = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        id value1 = [obj1 valueForKey:keyWordName];
        id value2 = [obj2 valueForKey:keyWordName];

        //如果是字符串则转换成数字进行比较
        if ([[obj1 valueForKey:keyWordName] isKindOfClass:[NSString class]]) {
            value1 = [NSNumber numberWithFloat:[[obj1 valueForKey:keyWordName] floatValue]];
        }
        if ([[obj2 valueForKey:keyWordName] isKindOfClass:[NSString class]]) {
            value2 = [NSNumber numberWithFloat:[[obj2 valueForKey:keyWordName] floatValue]];
        }
        
        if (sortCompareType == SortCompareDownType) {
            
            return [value2 compare:value1]; //降序
            
        }
        else{
            
            return [value1 compare:value2]; //升序
            
        }
        
    }];
    return result;
}

@end
