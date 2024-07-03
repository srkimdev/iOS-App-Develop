//
//  PriorityViewController.swift
//  Reminder Project
//
//  Created by 김성률 on 7/3/24.
//

import UIKit
import SnapKit

class PriorityViewController: UIViewController {

    let segment = UISegmentedControl(items: ["높음", "보통", "낮음"])
    
    var segmentTitle: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
        segment.addTarget(self, action: #selector(segmentClicked), for: .valueChanged)
    }
    
    func configureHierarchy() {
        view.addSubview(segment)
    }
    
    func configureLayout() {
        segment.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(44)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
    }
    
    @objc func segmentClicked(sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        let title = sender.titleForSegment(at: index)!
        
        segmentTitle?(title)
    }

}
