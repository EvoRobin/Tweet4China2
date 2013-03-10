//
//  HSUBaseDataSource.m
//  Tweet4China
//
//  Created by Jason Hsu on 3/10/13.
//  Copyright (c) 2013 Jason Hsu <support@tuoxie.me>. All rights reserved.
//

#import "HSUBaseDataSource.h"
#import "HSUBaseTableCell.h"

@implementation HSUBaseDataSource
{
    NSMutableArray *data;
}

#pragma mark - TableView
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *cellData = data[indexPath.row];
    NSString *dataType = cellData[@"data_type"];
    HSUBaseTableCell *cell = (HSUBaseTableCell *)[tableView dequeueReusableCellWithIdentifier:dataType];
    [cell setupWithData:cellData atIndex:indexPath.row];
    cell.defaultActionTarget = tableView.delegate;
    cell.defaultActionEvents = UIControlEventTouchUpInside;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return data.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - Data
- (NSArray *)allData
{
    return data;
}

- (NSMutableDictionary *)dataAtIndex:(NSInteger)index
{
    if (data.count < index) {
        return data[index];
    }
    // Warn
    return nil;
}

- (void)setTarget:(id)target forKey:(NSString *)key atIndex:(NSInteger)index
{
    NSMutableDictionary *cellData = [self dataAtIndex:index];
    cellData[[NSString stringWithFormat:@"%@_t", key]] = target;
}

- (void)setAction:(SEL)action forKey:(NSString *)key atIndex:(NSInteger)index
{
    NSMutableDictionary *cellData = [self dataAtIndex:index];
    cellData[[NSString stringWithFormat:@"%@_a", key]] = NSStringFromSelector(action);
}

- (void)setEvents:(UIControlEvents)events forKey:(NSString *)key atIndex:(NSInteger)index
{
    NSMutableDictionary *cellData = [self dataAtIndex:index];
    cellData[[NSString stringWithFormat:@"%@_e", key]] = [NSNumber numberWithInteger:events];
}

- (void)setTarget:(id)target action:(SEL)action events:(UIControlEvents)events forKey:(NSString *)key atIndex:(NSInteger)index
{
    [self setTarget:target forKey:key atIndex:index];
    [self setAction:action forKey:key atIndex:index];
    [self setEvents:events forKey:key atIndex:index];
}

- (void)setTarget:(id)target forKey:(NSString *)key
{
    for (int i=0; i<self.count; i++) {
        [self setTarget:target forKey:key atIndex:i];
    }
}

- (void)setAction:(SEL)action forKey:(NSString *)key
{
    for (int i=0; i<self.count; i++) {
        [self setAction:action forKey:key atIndex:i];
    }
}

- (void)setEvents:(UIControlEvents)events forKey:(NSString *)key
{
    for (int i=0; i<self.count; i++) {
        [self setEvents:events forKey:key atIndex:i];
    }
}

- (void)setTarget:(id)target action:(SEL)action events:(UIControlEvents)events forKey:(NSString *)key
{
    for (int i=0; i<self.count; i++) {
        [self setTarget:target action:action events:events forKey:key atIndex:i];
    }
}

- (void)refresh
{
    
}

- (void)loadMore
{
    
}

- (void)loadFromIndex:(NSInteger)startIndex toIndex:(NSInteger)endIndex
{
    
}

@end