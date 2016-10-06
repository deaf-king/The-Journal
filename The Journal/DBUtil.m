//
//  DBUtil.m
//  The Journal
//
//  Created by HRF on 16/10/5.
//  Copyright © 2016年 HRF. All rights reserved.
//

#import "DBUtil.h"

@interface DBUtil ()

@property(strong, nonatomic)NSString* diaryAndAccountPath;
@property(strong, nonatomic)FMDatabase* db;

@end

@implementation DBUtil

static DBUtil* instance = nil;

+ (instancetype)getInstance {
    
    if (instance == nil) {
        instance = [[DBUtil alloc] init];
    }
    
    return instance;
}

- (instancetype)init {
    NSLog(@"this one init");
    self = [super init];
    if (self) {
        
        NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        NSString *path = [docPaths objectAtIndex:0];
        
        //判断Cache文件夹是否存在，不存在则建立，以防清理缓存时Cache文件夹被删掉导致错误
        NSFileManager *manager = [NSFileManager defaultManager];
        BOOL tag = [manager fileExistsAtPath:path isDirectory:NULL];
        
        if (!tag) {
            [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:NULL];
        }
        //
        self.diaryAndAccountPath = [path stringByAppendingPathComponent:@"diaryAndAccount.db"];
        self.db = [FMDatabase databaseWithPath:self.diaryAndAccountPath];
        
        [self open];
        [self createTable];
        [self close];
    }
    
    return self;
}

- (void)open {
    
    if (![self.db open]) {
        
        NSLog(@"The DB is open error!");
        return;
    }
}

- (void)close {
    
    [self.db close];
}

- (void)createTable {
    
    NSString *diarySql = @"create table if not exists DiaryTable(objectId text, title text, whether text, content text, date text)";
//    NSString *sql2 = @"create table if not exists MenuTypeTbl(objectid text, name text)";
    
    [self.db executeUpdate:diarySql];
//    [self.db executeUpdate:sql2];
}

- (void)addItem:(DiaryItem*)item {
    
    [self open];
    
    NSString *sql = @"insert into DiaryTable(objectId, title, whether, content, date) values(?,?,?,?,?)";
    [self.db executeUpdate:sql, item.objectId, item.title, item.whether, item.content, item.date];
    
    [self close];
}

- (void)deleteItem:(NSString*)objectId {
    [self open];
    
    NSString *sql = @"delete from DiaryTable where objectId = ?";
    [self.db executeUpdate:sql, objectId];
    
    [self close];
}

- (void)addItems:(NSArray*)items {
    [self open];
    
    for (DiaryItem* item in items) {
        
        NSString *sql = @"insert into DiaryTable(objectId, title, whether, content, date) values(?,?,?,?,?)";
        [self.db executeUpdate:sql, item.objectId, item.title, item.whether, item.content, item.date];
    }
    
    [self close];
}
- (void)deleteItems:(NSArray*)items {
    [self open];
    
    for (DiaryItem* item in items) {
        
        NSString *sql = @"delete from DiaryTable where objectId = ?";
        [self.db executeUpdate:sql, item.objectId];
    }
    
    [self close];
}

- (void)clearDatas {
    [self open];
    
    NSString* sql = @"delete * frome DiaryTable";
    [self.db executeUpdate:sql];
    
    [self close];
}

- (NSMutableArray *)queryItems {
    
    [self open];
    
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM DiaryTable"];
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:10];
    while ([resultSet next]) {
        
        DiaryItem* item = [[DiaryItem alloc] init];
        item.objectId = [resultSet stringForColumn:@"objectId"];
        item.title = [resultSet stringForColumn:@"title"];
        item.whether = [resultSet stringForColumn:@"whether"];
        item.content = [resultSet stringForColumn:@"content"];
        item.date = [resultSet dateForColumn:@"date"];
        
        [items addObject:item];
    }
    
    [self close];
    return items;
}

@end
