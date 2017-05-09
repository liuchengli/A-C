//
//  CardSeletedController.m
//  A-C
//
//  Created by 刘成利 on 2017/5/9.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "CardSeletedController.h"
#import "CardSeletedCollectionView.h"

@interface CardSeletedController () <UICollectionViewDelegate,UICollectionViewDataSource>

/**
 * collectionView;
 */
@property(nonatomic,strong)UICollectionView * cardView;

/**
 * 存放img名字的数组;
 */
@property(nonatomic,strong)NSMutableArray * imgArray;

@end

@implementation CardSeletedController

- (void)setup{

    [super setup];
    
    [self getData];
    [self createCardView];

}

- (void)getData
{
    self.imgArray = [NSMutableArray array];
    
    for (int i = 8 ;i < 11; i++)
    {
        NSString * str = [NSString stringWithFormat:@"%d.jpg",i];
        [self.imgArray addObject:str];
    }
    
    for (int i = 13 ;i < 16; i++)
    {
        NSString * str = [NSString stringWithFormat:@"%d.jpg",i];
        [self.imgArray addObject:str];
    }
    
}
//创建collectionview
- (void)createCardView
{
    CardSeletedCollectionView * flowLayout = [[CardSeletedCollectionView alloc]init];
    _cardView = ({
        UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height) collectionViewLayout:flowLayout];
        
        collectionView.delegate   = self;
        collectionView.dataSource = self;
        
        //提前注册
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        collectionView;
    });
    [self.contentView addSubview:_cardView];
}

#pragma mark -- collectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imgArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    //先清空subviews 防止重影 有更好的方法一定要告诉我
    for (UIView * view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
    imageView.layer.shadowColor = [UIColor whiteColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    imageView.layer.shadowRadius = 5;
    imageView.layer.shadowOpacity = 0.8;
    imageView.image = [UIImage imageNamed:self.imgArray[indexPath.row]];
    
    //一定要添加到cell.contentView上
    [cell.contentView addSubview:imageView];
    
    return cell;
}

@end
