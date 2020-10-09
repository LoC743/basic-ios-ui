//
//  SectionSelector.swift
//  SocialAppVK
//
//  Created by Алексей Морозов on 09.10.2020.
//

import UIKit

class SectionSelector: UIControl {
    
    private var stackView: UIStackView!
    private var sectionButtons: [UIButton] = []
    private var sections: [Character] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupStackView() {
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    func updateSections(_ sections: [Character]) {
        sectionButtons = []
        self.sections = sections
        for section in sections {
            let letter = String(section)
            
            let button = UIButton(type: .system)
            button.setTitle(letter, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectSection(_:)), for: .touchUpInside)
            
            sectionButtons.append(button)
        }
        stackView = UIStackView(arrangedSubviews: sectionButtons)
        setupStackView()
    }
    
    @objc func selectSection(_ sender: UIButton) {
        guard let index = sectionButtons.firstIndex(of: sender) else { return }
        print(sections[index])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }

}
