//
//  ViewController.swift
//  RPSGAme
//
//  Created by Nam on 7/12/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var lblMain: UILabel!
    
    @IBOutlet var imgViewCom: UIImageView!
    @IBOutlet var imgViewUser: UIImageView!
    
    @IBOutlet var lblComChoice: UILabel!
    @IBOutlet var lblUserChoice: UILabel!
    
    var myChoice: Rps = Rps.rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!  // 잘못된 값이 들어갈 수 있으므로 옵셔널 타입 -> ! 로 언래핑
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgViewCom.image = #imageLiteral(resourceName: "ready") // 이미지 리터럴 활용
        imgViewUser.image = UIImage(named: "ready.png") // 직접 이미지 이름 활용
        
        lblComChoice.text = "준비"
        lblUserChoice.text = "준비"
        
    }

    
    @IBAction func btnRPSTapped(_ sender: UIButton) {   // 비슷한 역할의 객체의 경우 하나에 함수에 여러개의R 객체를 연결할 수 있다
        guard let title = sender.currentTitle else {    // 타이틀이 있는 경우 작동
            return
        }
//        let title = sender.currentTitle!    // 강제 옵셔널 바인딩 (값이 확실히 있는 경우)
        
        switch title {
        case "가위":
            myChoice = Rps.scissors // 열거형이 변수에 저장
        case "바위":
            myChoice = Rps.rock
        case "보" :
            myChoice = Rps.paper
        default:
            break
        }
        
    }
    
    @IBAction func btnSelectTapped(_ sender: UIButton) {
        switch comChoice {  // 컴퓨터의 선택
        case Rps.rock:
            imgViewCom.image = #imageLiteral(resourceName: "rock")
            lblComChoice.text = "바위"
        case Rps.paper:
            imgViewCom.image = #imageLiteral(resourceName: "paper")
            lblComChoice.text = "보"
        case Rps.scissors:
            imgViewCom.image = #imageLiteral(resourceName: "scissors")
            lblComChoice.text = "가위"
        }
        
        switch myChoice {   // 유저의 선택
        case Rps.rock:
            imgViewUser.image = #imageLiteral(resourceName: "rock")
            lblUserChoice.text = "바위"
        case Rps.paper:
            imgViewUser.image = #imageLiteral(resourceName: "paper")
            lblUserChoice.text = "보"
        case Rps.scissors:
            imgViewUser.image = #imageLiteral(resourceName: "scissors")
            lblUserChoice.text = "가위"
        }
        
        if myChoice == comChoice {
            lblMain.text = "무승부"
        } else if comChoice == .rock && myChoice == .paper {
            lblMain.text = "승리"
        } else if comChoice == .paper && myChoice == .scissors {
            lblMain.text = "승리"
        } else if comChoice == .scissors && myChoice == .rock {
            lblMain.text = "승리"
        } else {
            lblMain.text = "패배"
        }
        
        comChoice = Rps(rawValue: Int.random(in: 0...2))!   // 매 판마다 컴퓨터의 선택이 랜덤하게 바뀌도록
    }
    
    @IBAction func btnResetTapped(_ sender: UIButton) { // 세팅 초기화 함수
        lblMain.text = "선택하세요"
        
        imgViewCom.image = #imageLiteral(resourceName: "ready") // 이미지 리터럴 활용
        imgViewUser.image = UIImage(named: "ready.png") // 직접 이미지 이름 활용
        
        lblComChoice.text = "준비"
        lblUserChoice.text = "준비"
    }
    
}

