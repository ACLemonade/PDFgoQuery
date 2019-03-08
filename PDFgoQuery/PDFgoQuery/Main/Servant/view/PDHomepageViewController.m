//
//  PDHomepageViewController.m
//  PDFgoQuery
//
//  Created by Lemonade on 2019/3/6.
//  Copyright © 2019 Lemonade. All rights reserved.
//

#import "PDHomepageViewController.h"
#import "PDServantDetailViewController.h"
#import "PDHomepageViewModel.h"

static NSString *const const_type_cell_ID = @"const_type_cell_ID";

static CGFloat const const_cell_line_spacing = 10;
static CGFloat const const_cell_interitem_spacing = 10;
static NSInteger const const_cell_num_per_line = 5;

@interface PDHomepageViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *typeCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *typeFlowLayout;

//@property (nonatomic, readwrite, strong) NSArray *typeBackList;

@property (nonatomic, readwrite, strong) PDHomepageViewModel *viewModel;

@end

@implementation PDHomepageViewController
#pragma mark - Life Circle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"从者选择";
    // 注册cell
    [self.typeCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:const_type_cell_ID];
//    self.typeBackList = @[@"back_Saber", @"back_Archer", @"back_Lancer", @"back_Rider", @"back_Caster", @"back_Assassin", @"back_Berserker", @"back_Ruler", @"back_Avenger", @"back_Alterego", @"back_Foreigner", @"back_Other"];
    self.typeFlowLayout.minimumLineSpacing = const_cell_line_spacing;
    self.typeFlowLayout.minimumInteritemSpacing = const_cell_interitem_spacing;
    self.typeFlowLayout.sectionInset = UIEdgeInsetsMake(0, const_cell_interitem_spacing, const_cell_line_spacing, const_cell_interitem_spacing);
    CGFloat width = (SCREEN_WIDTH-const_cell_interitem_spacing*2-const_cell_interitem_spacing*(const_cell_num_per_line-1))/const_cell_num_per_line;
    CGFloat height = width*140/128;
    self.typeFlowLayout.itemSize = CGSizeMake(width, height);
    self.typeFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    [self bindSignal];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)bindSignal {
    @weakify(self)
    [self.viewModel.servantListCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        [self.typeCollectionView reloadData];
    }];
    [self.viewModel.servantListCommand execute:nil];
}
#pragma mark - UICollectionViewDataSource/Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.servantList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:const_type_cell_ID forIndexPath:indexPath];
    PDServantListModel *model = self.viewModel.servantList[indexPath.row];
    NSString *iconPath = [model.imgPath containsString:CONST_BASE_URL] ? model.imgPath :[CONST_BASE_URL stringByAppendingString:model.imgPath];
    UIImageView *iconIV = [[UIImageView alloc] init];
    [iconIV sd_setImageWithURL:[NSURL URLWithString:iconPath]];
    cell.backgroundView = iconIV;
    cell.backgroundColor = UIColor.whiteColor;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    PDServantListModel *model = self.viewModel.servantList[indexPath.row];
    NSLog(@"英灵编号: %@", model.ID);
    PDServantDetailViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([PDServantDetailViewController class])];
    vc.servantId = model.ID;
    vc.navigationItem.title = model.name;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - Lazy Load
- (PDHomepageViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[PDHomepageViewModel alloc] init];
    }
    return _viewModel;
}
@end
