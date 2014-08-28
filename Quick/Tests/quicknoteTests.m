//
//  quicknoteTests.m
//  quicknoteTests
//
//  Created by hello on 14-3-1.
//  Copyright (c) 2014年 hellomaya. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Post.h"
#import "Tag.h"
#import "Image.h"
#import "CategoryM.h"

@interface quicknoteTests : XCTestCase

@end

@implementation quicknoteTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    
    Tag *tag = [[Tag alloc] init];
    
#if true
    for (int i = 0; i < 100; ++i) {
        tag.name = [NSString stringWithFormat:@"%@%d", @"tag_", i];
        [tag add];
    }
#endif
    
#if true
    NSMutableArray *tagArray;

    tagArray = [[NSMutableArray alloc] init];
    
    [tag fetch:tagArray Filter:@"1=1" Order:@"tag_id DESC" Page:0 PageSize:20];
    
    NSLog(@"tags = %@", tagArray);
#endif
    
#if true
    Post *post = [[Post alloc] init];
    
    for (int i = 0; i < 100; ++i) {
        //post.postId = i;
        post.name = [NSString stringWithFormat:@"%@%d",@"post_",i];
        post.created = [[NSDate date] timeIntervalSince1970];
        post.updated = post.created;
        [post add];
        
        [post updateTag:tagArray];
    }
#endif
    
    //Post *post = [[Post alloc] init];
    
    //post.name
    
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testFetchingPost
{
    NSMutableArray *postArray = [[NSMutableArray alloc] init];
    
    Post *post = [[Post alloc] init];
    
    [post fetch:postArray Filter:@"1=1" Order:@"post_id DESC" Page:0 PageSize:200];
    
    for (Post *post in postArray) {
        NSLog(@"post = %@", post.name);
    }
    
    NSDictionary *dic = @{@"hello":[NSNumber numberWithBool:YES]};
    NSLog(@"dic = %@", dic);
    
    //2014.03.16 - can't print postArray...
    //NSLog(@"post = %@", postArray);
}

- (void)testCategory
{
    NSMutableArray *categories = [[NSMutableArray alloc] init];
    NSString *name;
    CategoryM *category;
    
    for (int i = 0; i < 100; ++i) {
        
        category = [[CategoryM alloc] init];
        name = [NSString stringWithFormat:@"category_%d", i];
        
        category.name = name;
        category.nameIndex = [[name substringToIndex:1] uppercaseString];
        category.sort = i;
        category.level = 0;
        
        [categories addObject:category];
        
        category = nil;
    }
    
    for (CategoryM *category in categories) {
        
        [category add];
        
    }
    
    NSMutableArray *subcategories = [[NSMutableArray alloc] init];
    
    for (CategoryM *c in categories) {
        
        // why i < 100 ==> open error?
        for (int i = 0; i < 10; ++i) {
            category = [[CategoryM alloc] init];
            name = [NSString stringWithFormat:@"category_%d", i];
            
            category.name = name;
            category.nameIndex = [[name substringToIndex:1] uppercaseString];
            category.sort = i;
            category.level = c.level + 1;
            category.family = c.family;
            
            [subcategories addObject:category];
            
            category = nil;
        }
        
    }
    
    for (CategoryM *category in subcategories) {
        
        [category add];
        
    }
    
    
}

@end