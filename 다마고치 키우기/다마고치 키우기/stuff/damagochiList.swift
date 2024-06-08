//
//  damagochiList.swift
//  다마고치 키우기
//
//  Created by 김성률 on 6/6/24.
//

import UIKit

struct Damagochi {
    
    var rice: Int {
        didSet {
            updateLevel()
        }
    }
    
    var water: Int {
        didSet {
            updateLevel()
        }
    }
    
    let name: String
    var level: Int
    var type: Int
    var image: String
    
    init(rice: Int = UserDefaults.standard.integer(forKey: "rice"), water: Int = UserDefaults.standard.integer(forKey: "water"), type: Int, name: String) {
        self.rice = rice
        self.water = water
        self.name = name
        self.type = type
        self.level = 1
        self.image = "1-1"
        self.updateLevel()
    }
    
    mutating func updateLevel() {
        let amount = rice / 5 + water / 2
        
        if amount < 20 {
            level = 1
        } else if amount < 30 {
            level = 2
        } else if amount < 40 {
            level = 3
        } else if amount < 50 {
            level = 4
        } else if amount < 60 {
            level = 5
        } else if amount < 70 {
            level = 6
        } else if amount < 80 {
            level = 7
        } else if amount < 90 {
            level = 8
        } else if amount < 100 {
            level = 9
        } else {
            level = 10
        }
        
        if type == 0 {
            level = 0
        }

        updateImage()
    }
    
    mutating func updateImage() {
        
        if level == 0 {
            image = "noImage"
        } else if level <= 1 {
            image = "\(type)-1"
        } else if level <= 2 {
            image = "\(type)-2"
        } else if level <= 3 {
            image = "\(type)-3"
        } else if level <= 4 {
            image = "\(type)-4"
        } else if level <= 5 {
            image = "\(type)-5"
        } else if level <= 6 {
            image = "\(type)-6"
        } else if level <= 7 {
            image = "\(type)-7"
        } else if level <= 8 {
            image = "\(type)-8"
        } else {
            image = "\(type)-9"
        }
    }
    
}

struct DamagochiList {
    var damagochiArray: [Damagochi] = [
        Damagochi(
            type: 1,
            name: "따끈따끈 다마고치"
        ),
         Damagochi(
            type: 2,
            name: "방실방실 다마고치"
         ),
         Damagochi(
            type: 3,
            name: "반짝반짝 다마고치"
         ),
        Damagochi(
            type: 0,
            name: "준비중이에요"
        ),
         Damagochi(
            type: 0,
            name: "준비중이에요"
         ),
         Damagochi(
            type: 0,
            name: "준비중이에요"
         ),
        Damagochi(
            type: 0,
            name: "준비중이에요"
        ),
        Damagochi(
            type: 0,
            name: "준비중이에요"
        ),
        Damagochi(
            type: 0,
            name: "준비중이에요"
        ),
        Damagochi(
            type: 0,
            name: "준비중이에요"
        ),
        Damagochi(
            type: 0,
            name: "준비중이에요"
        ),
        Damagochi(
            type: 0,
            name: "준비중이에요"
        ),
        Damagochi(
            type: 0,
            name: "준비중이에요"
        ),
        Damagochi(
            type: 0,
            name: "준비중이에요"
        ),
        Damagochi(
            type: 0,
            name: "준비중이에요"
        )]
}

struct Setting {
    
    let titleLabel: String
    let name: String?
    let settingImage: String
    
}

struct SettingList {
    let settingList: [Setting] = [
        Setting(titleLabel: "내 이름 설정하기", name: UserDefaults.standard.string(forKey: "nameChange"), settingImage: "pencil"),
        Setting(titleLabel: "다마고치 변경하기", name: nil, settingImage: "moon.fill"),
        Setting(titleLabel: "데이터 초기화", name: nil, settingImage: "arrow.clockwise")
        ]
}

