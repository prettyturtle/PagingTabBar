//
//  MainViewController.swift
//  PagingTabBar
//
//  Created by yc on 2022/01/04.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private let categoryTitleList = [ "추천", "신상품", "베스트", "알뜰쇼핑", "특가/혜택" ]
    
    private lazy var pagingTabBar = PagingTabBar(categoryTitleList: categoryTitleList)
    private lazy var pagingView = PagingView(categoryTitleList: categoryTitleList)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .red
        
    }
}

private extension MainViewController {
    func setupLayout() {
        [
            pagingTabBar,
            pagingView
        ].forEach { view.addSubview($0) }
        
        pagingTabBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(pagingTabBar.cellHeight)
        }
        pagingView.snp.makeConstraints { make in
            make.top.equalTo(pagingTabBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
