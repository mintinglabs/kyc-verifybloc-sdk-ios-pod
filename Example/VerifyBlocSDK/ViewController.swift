//
//  ViewController.swift
//  VerifyBlockDemo
//
//  Created by 修齐 on 2022/8/30.
//

import UIKit
import VerifyBloc
import SnapKit

class ViewController: UIViewController {
    
    private var standerdResultDisplay: Bool = true
    private var gradeColor: UIColor?
    

    private lazy var colorField: UITextField = {
        let field = UITextField(frame: .zero)
        field.delegate = self
        field.borderStyle = .roundedRect
        field.placeholder = "#FFFFFF"
        return field
    }()
    
    private lazy var userField: UITextField = {
        let field = UITextField(frame: .zero)
        field.delegate = self
        field.borderStyle = .roundedRect
        field.placeholder = "必填"
        field.text = "MhbtGIusylTxjPcCtm6Jq6tu4nH3"
        return field
    }()
    
    // 圆角值设置
    private lazy var bncornerField: UITextField = {
        let field = UITextField(frame: .zero)
        field.delegate = self
        field.borderStyle = .roundedRect
        field.placeholder = "按钮圆角值"
        return field
    }()
    
    // 按钮背景颜色
    private lazy var bnColorField: UITextField = {
        let field = UITextField(frame: .zero)
        field.delegate = self
        field.borderStyle = .roundedRect
        field.placeholder = "#FFFFFF 单色调"
        field.text = "1E90FF"
        return field
    }()
    
    private lazy var grade1Bn: UIButton = {
        let button = UIButton(frame: .zero)
        button.tag = 1024
        button.backgroundColor = UIColor(patternImage: UIImage(named: "grade_1_bg")!)
        button.addTarget(self, action: #selector(gradeAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var grade2Bn: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(patternImage: UIImage(named: "grade_2_bg")!)
        button.addTarget(self, action: #selector(gradeAction(_:)), for: .touchUpInside)
        button.tag = 1025
        return button
    }()
    
    // 按钮字体颜色
    private lazy var bnTitleColorField: UITextField = {
        let field = UITextField(frame: .zero)
        field.delegate = self
        field.borderStyle = .roundedRect
        field.placeholder = "#FFFFFF 单色调"
        field.text = "FFFFFF"
        return field
    }()
    
    // 按钮字体颜色
    private lazy var languageField: UITextField = {
        let field = UITextField(frame: .zero)
        field.delegate = self
        field.borderStyle = .roundedRect
        field.placeholder = "语言(en,zh-Hans)"
        field.text = "zh-Hans"
        return field
    }()
    
    // dark
    private lazy var darkBn: UIButton = {
        let bn = UIButton(frame: .zero)
        bn.setTitle("Dark模式", for: .normal)
        bn.setTitleColor(UIColor(hexString: "#39DC97"), for: .selected)
        bn.setTitleColor(.black, for: .normal)
        bn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        bn.titleLabel?.font = .systemFont(ofSize: 15)
        bn.addTarget(self, action: #selector(darkAction), for: .touchUpInside)
        bn.backgroundColor = UIColor(hexString: "F6F6F6")
        return bn
    }()
    
    // light
    private lazy var lightBn: UIButton = {
        let bn = UIButton(frame: .zero)
        bn.setTitle("Light模式", for: .normal)
        bn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        bn.setTitleColor(UIColor(hexString: "#39DC97"), for: .selected)
        bn.setTitleColor(.black, for: .normal)
        bn.titleLabel?.font = .systemFont(ofSize: 15)
        bn.addTarget(self, action: #selector(lightAction), for: .touchUpInside)
        bn.backgroundColor = UIColor(hexString: "F6F6F6")
        return bn
    }()
    
    private lazy var stardardResultBn: UIButton = {
        let bn = UIButton(frame: .zero)
        bn.setTitle("Test Data", for: .normal)
        bn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        bn.setTitleColor(UIColor(hexString: "#39DC97"), for: .selected)
        bn.setTitleColor(.black, for: .normal)
        bn.titleLabel?.font = .systemFont(ofSize: 15)
        bn.addTarget(self, action: #selector(standerdAction), for: .touchUpInside)
        bn.backgroundColor = UIColor(hexString: "F6F6F6")
        return bn
    }()
    
    private lazy var nstardardResultBn: UIButton = {
        let bn = UIButton(frame: .zero)
        bn.setTitle("Real Data", for: .normal)
        bn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        bn.setTitleColor(UIColor(hexString: "#39DC97"), for: .selected)
        bn.setTitleColor(.black, for: .normal)
        bn.titleLabel?.font = .systemFont(ofSize: 15)
        bn.addTarget(self, action: #selector(nstanderdAction), for: .touchUpInside)
        bn.backgroundColor = UIColor(hexString: "F6F6F6")
        return bn
    }()
    
    private lazy var textView: UITextView = {
        let view = UITextView(frame: .zero)
        view.isEditable = false
        return view
    }()
    
    @objc private func darkAction() {
        lightBn.isSelected = false
        darkBn.isSelected = true
        VerifyBlocManager.changeStyle(.dark)
    }
    
    @objc private func lightAction() {
        lightBn.isSelected = true
        darkBn.isSelected = false
        VerifyBlocManager.changeStyle(.light)
    }
    
    @objc private func standerdAction() {
        stardardResultBn.isSelected = true
        nstardardResultBn.isSelected = false
        standerdResultDisplay = true
    }
    
    @objc private func nstanderdAction() {
        nstardardResultBn.isSelected = true
        stardardResultBn.isSelected = false
        standerdResultDisplay = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    private func configView() {
        
        view.addSubview(stardardResultBn)
        stardardResultBn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        view.addSubview(nstardardResultBn)
        nstardardResultBn.snp.makeConstraints { make in
            make.left.equalTo(stardardResultBn.snp.right).offset(16)
            make.centerY.equalTo(stardardResultBn.snp.centerY)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        stardardResultBn.isSelected = standerdResultDisplay
        nstardardResultBn.isSelected = !standerdResultDisplay
        
        let languageHintLb = UILabel(frame: .zero)
        languageHintLb.font = .systemFont(ofSize: 15)
        languageHintLb.text = "语言:"
        view.addSubview(languageHintLb)
        languageHintLb.snp.makeConstraints { make in
            make.top.equalTo(nstardardResultBn.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(65)
        }
        
        view.addSubview(languageField)
        languageField.snp.makeConstraints { make in
            make.centerY.equalTo(languageHintLb.snp.centerY)
            make.left.equalTo(languageHintLb.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        let colorHintLb = UILabel(frame: .zero)
        colorHintLb.font = .systemFont(ofSize: 15)
        colorHintLb.text = "主题色:"
        view.addSubview(colorHintLb)
        colorHintLb.snp.makeConstraints { make in
            make.top.equalTo(languageField.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(65)
        }
        
        view.addSubview(colorField)
        colorField.snp.makeConstraints { make in
            make.centerY.equalTo(colorHintLb.snp.centerY)
            make.left.equalTo(colorHintLb.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        let userHintLb = UILabel(frame: .zero)
        userHintLb.text = "UserId:"
        userHintLb.font = .systemFont(ofSize: 15)
        view.addSubview(userHintLb)
        userHintLb.snp.makeConstraints { make in
            make.top.equalTo(colorHintLb.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(65)
        }
        
        view.addSubview(userField)
        userField.snp.makeConstraints { make in
            make.centerY.equalTo(userHintLb.snp.centerY)
            make.left.equalTo(userHintLb.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        let cornerHintLb = UILabel(frame: .zero)
        cornerHintLb.text = "按钮圆角："
        cornerHintLb.font = .systemFont(ofSize: 15)
        view.addSubview(cornerHintLb)
        cornerHintLb.snp.makeConstraints { make in
            make.top.equalTo(userHintLb.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(90)
        }
        
        view.addSubview(bncornerField)
        bncornerField.snp.makeConstraints { make in
            make.centerY.equalTo(cornerHintLb.snp.centerY)
            make.left.equalTo(cornerHintLb.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        let bnColorLb = UILabel(frame: .zero)
        bnColorLb.text = "按钮背景："
        bnColorLb.font = .systemFont(ofSize: 15)
        view.addSubview(bnColorLb)
        bnColorLb.snp.makeConstraints { make in
            make.top.equalTo(cornerHintLb.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(90)
        }
        
        view.addSubview(bnColorField)
        bnColorField.snp.makeConstraints { make in
            make.centerY.equalTo(bnColorLb.snp.centerY)
            make.left.equalTo(bnColorLb.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        view.addSubview(grade1Bn)
        grade1Bn.snp.makeConstraints { make in
            make.top.equalTo(bnColorField.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        view.addSubview(grade2Bn)
        grade2Bn.snp.makeConstraints { make in
            make.top.equalTo(bnColorField.snp.bottom).offset(25)
            make.left.equalTo(grade1Bn.snp.right).offset(16)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        let bnTitleColorLb = UILabel(frame: .zero)
        bnTitleColorLb.text = "按钮字体："
        bnTitleColorLb.font = .systemFont(ofSize: 15)
        view.addSubview(bnTitleColorLb)
        bnTitleColorLb.snp.makeConstraints { make in
            make.top.equalTo(grade2Bn.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(90)
        }
        
        view.addSubview(bnTitleColorField)
        bnTitleColorField.snp.makeConstraints { make in
            make.centerY.equalTo(bnTitleColorLb.snp.centerY)
            make.left.equalTo(bnTitleColorLb.snp.right).offset(5)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        view.addSubview(darkBn)
        darkBn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(bnTitleColorField.snp.bottom).offset(15)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        view.addSubview(lightBn)
        lightBn.snp.makeConstraints { make in
            make.left.equalTo(darkBn.snp.right).offset(16)
            make.centerY.equalTo(darkBn.snp.centerY)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        let testBn = UIButton(frame: .zero)
        testBn.setTitle("个人认证", for: .normal)
        testBn.backgroundColor = UIColor.black
        testBn.addTarget(self, action: #selector(verifyIdentity), for: .touchUpInside)
        view.addSubview(testBn)
        
        let test2Bn = UIButton(frame: .zero)
        test2Bn.setTitle("企业认证", for: .normal)
        test2Bn.backgroundColor = UIColor.black
        test2Bn.addTarget(self, action: #selector(verifyBusiness), for: .touchUpInside)
        view.addSubview(test2Bn)
        
        testBn.snp.makeConstraints { make in
            make.top.equalTo(lightBn.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(test2Bn.snp.left ).offset(-16)
            make.height.equalTo(44)
        }
        
        test2Bn.snp.makeConstraints { make in
            make.top.equalTo(lightBn.snp.bottom).offset(10)
            make.left.equalTo(testBn.snp.right).offset(16)
            make.right.equalToSuperview().offset(-16)
            make.width.height.equalTo(testBn);
        }
        
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.top.equalTo(testBn.snp.bottom).offset(15)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    @objc private func verifyIdentity() {
        verifyAction(verifyType: .person)
    }
    
    @objc private func verifyBusiness() {
        verifyAction(verifyType: .corporate)
    }
    
    private func verifyAction(verifyType: VerifyBlocIdentityType) {
        textView.text = ""

        var color = colorField.text?.trimSpace ??  ""
        if color.isEmpty {
            color = "#39DC97"
        }

        let user = userField.text?.trimSpace ?? ""
        if user.isEmpty {
            return
        }

        let userId: String = user
        var appId: String = ""
        var parterId: String = ""
        var secret: String = ""
        if standerdResultDisplay {
            appId = "AP23021640379390003537"
            parterId = "PAT23021640155283006022"
            secret = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCUx2lA3XUEzkwCtSO3vPwh9iEI9ZZPz9YEoH+IoANC4npsNiRwniJVHRHwKxfmRk2bgexodHoikmXwDXvTOsbXIiCz+gGQjZF/uicY8jefddOf/n9rv0ogdSbdrqlFWVocjkjNIpyLVAdmeeCPtCyAt/x6G7NY8JODwtdZv2d0gIpeRdvnuZN6+sKIaYR4t+d9CQj7Va/U2HknSSEXReSsyhKJ7oBySEftkHoF/0K5PQxl1NPVZ9QQrj4z3ONVBr9YAG7k2SExtNITEqO6xDjNt487bbWjgLmDlRgLAvS6fdNUpXCVMWWN+901diu5Ui3A+PsrIw5me7Sl9jx9hH1nAgMBAAECggEAdPehpEF3cmPOFoLapeWKRBkBN838cprvo4ubOIq0ha0Qmmqmk3N/gnLsW2lFzOCQuyWV+zk3nF6EjgnLw/F9yj0mgNiYylDChyyO+GnVmSRFUJABFXC6knIIMFjU85Sf57tlOQFxGYjimIpRJil8o2YCtO16Pv5Eu14/eGumpkwFmlE7SESpeU1XdzogPT6cTmYaNSTTCaSuciw2vJIaKOz5HT8sp/nFD0mFDXPwAXJojpPC+XbcqMCTifMbAtcCB/9CJHTT56sq2Xo9mji6/6hvFPM4r5lUGJI3f78Je1wAsPULT3Wb+u5dnpaKzqNnp2xNwwFeKpm3hfW+XyzJQQKBgQDFP5CQ5jt2DpktDXiM8S5Fp0mZFMyRF15He9TuxWuIDfGhPDcg94KumW+G8vAl44XAkM2bnAbATiqtBuQYw3UXF8KLwUqJmSS1pJBkhjfHS6cA+5pCqsEiqfOmGyCxJqvH6vQ7/u6jDgAxNn5s31QLhc70yqydvTcC2FUnDEiwWQKBgQDBF/8ZEwWg8PfUTMP5a63+ixF+q7uKRHHTlz+a1Z1vB2NkofY0sc+6yqVUgMeeJktFEevYWEEwOL1XDQVTwDQqHTeJaHxny8N5M45vMwG3Ffi2fN5Ap+4EWQNTR/5cK3kvxybwZV2Xv24Lmy2tYE/JGdrraTEX0tNwy9WR6PrjvwKBgF1bCmcqMLZdjm3eVFIQzF+3H4RObcu2Da8zksI3uf846kXvo//8ZWORx1FNpg+oseNEJawimqdl15jxDAAUclStsCxJHagmTVOTQavyQnAXBEHY01f+TU7EtUbGzCBMNz11nIbQz81okPq52fhZcwPJHvyI+E3oAiNclGDY1YZxAoGAb6m72Lk6WQ7gkoHuFq/hh8DOVi1jn5rjJFRj8Ns1Vr60CL7sjR6CnWeQ4mQyi89jWcb6Vzr6P7OgMtYRzZPp1qzcr/afcrrQCKf6521cwY7QLF/bexJhv1vmY2PPwWdWhn2pk/1aeWW3crjDWm7G1OnBwr8rJ7bAlYsar21GoSsCgYBBzdidyVt0CDCI74GTFY1ZTzA3EKCTHte6lTYK9wjxYqgXYMWCi3F3uHWa1nBfCzNdcozUVVYcJyKxILfyQx0PG+wKfH95Ax9CkEJe+i9H+dEBpmueXIctOXAB+gWhR1vC1EVH6BdRiwDBY3II7O13Eg3tE6geBvw5CuJnUgL/VA=="
            
        } else {
            appId = "AP22120182888394002005"
            parterId = "PAT22112103729611007290"
            secret = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCrKFVUAHHckaao sw17IbeCoWRfX3M9LoYnyReqFus88r3J+02Hlak2Om1dFQAoq+QffOvsQLaFXVFb XL38KTQWVkJBcAxy+yEmG4YUIgx9iMzyOq/O3Nvi4np7pgGEf43Hs3D1fbXEtU5B PN7lvCGUVCpUGqongzjmNKtKdOb9GQkX7DDLRxD2EFrtX0K6x092ny9DAovs0ajY 62NxgkQrk5P+HMPWjZJ+7xgs4JJW1q7RIOrmwO4OeIOtvJsdFBgo4LWnk8oOMwim dv43zAk1DNhkuhVPQa0+z0o5zysakO1VqCKAHMBnyGcZWRu2itrEecSvi3uOODZc SONcOQIbAgMBAAECggEANSIjQx2UO033990F7VitOF9T4oumIbMksIsrzoCo7FXK 9z4Ndm7OhegjdUcEspuSCPhl4QTB5Krwi7VBwVslMV372YaoRrWRN9xJhkx/piTm wrfXRheoJ0n5jhMd230hjYI2Ke+pkvRZ48S6yYTaw8pRDaTtd7Cz5DsrhcS+xIkT 8HEgsmupu6a7CPIAD2yNBfHz8hG54m8ugUOTV9afKnFHnDbSxs1TbHhVXTpmleLE n3+NNVqngAyqvnXHR8M4ucY8GbcHPPCEPzWwxCoj8gQWDgmuqjK29aOAHMIizcR6 wrho/ORxeZ9Yigjtk/OObBhbeLmmq8+9oDbg9W3yGQKBgQDdQln9MuTnqA5Rz0rp K3TdICgh+SuFmHkSo3OgDgZKEUfpWPlHiwZ853u0NiMB+bmiwJM2LyQ/vS4ne8WA hvh9FXfp7AY9VEBZonNgzjM4KPuAfBCUaHNFzifGAqj0bxVQlz5f1aMTu1M3gzvs EGLUqgUKjRWkrhtphN8l8k9SDwKBgQDGCB2uhhIbUjRvK1QyFPH661v8xEnoV6Ed mIHVpCk7QaMHgECnJQkAGj2tDRQC1vmOi+OtIYMGsPgVNpOdIKo290l3Q5Kr6314 n4CaARv+DerDYNHpPalbnscT3yQa6cCV2Ih928uFnYlhJVPDYwzAfH4Rr4nqsBDN mNTrUzOrNQKBgCOrH6CuxLIHqI9NsJDYPZWsKmwXpAl8ZAA6M1iZCjCEiqg2fLEo 21nlY07Q72HRJTj0fIbeoKRZ1gftbxBiMcrQXC1srDDU1S7d/mWbuCwUhz7WQUH7 eKHHMyg7o4sMIU6FozuF0C1NJIQtdsp+dcA8zGVACz4qBydCkUqnvlvHAoGAP6Fn +CX4N3MoifgAK79zKU7q1cM0hEVz7ZCNV1pSLUof2k8pdwt9Yt0LqEklfuwYb+cf FwhHk6TVceuBbuGKD/NRVdMOk9MtE88cgV+N4QoTvwejKzC29EuGaCow7bziNsPG x7oSITLHa8GUsplnBYp676/ZvuEn5QgQkjS/y2kCgYEAjgEsrC20mbFZLnhWOJT2 Z6pov8wMwJJ1YnAdGYFO6coHpREjas28OG0dT/m5fEzeI706UCnPVj7sjgHPzLey 2jmM/I5x5Nljak767FFmsdgmyOP6AVoZdasWVFSuGFnNQZGPLXiUidemg/tf8lNgpqrR7aZ5njq/R8C5qv4glnM="
        }
        
        appId = "AP23031381299549002932"
        parterId = "PAT23031381202386007265"
        secret = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC+KvPeru4GmxA4WXaLmlnWCQFgrr6abJ7hRwtGDPvoEqaF5SnUlseryekglsJKGWV7zmT0Njte42EK5h0f01cKw02E1t/Tkgudf86VGHyP7+s4mE81f1xEMLgEGRlFiKklYOjxtleMJHxJS4/EYHGWtCivDoUMdofgyCL9cX4R5Hwna61JLUBNxTcBJt11qhG5hEV+8UN4YuRVB8jjUWaJqnWJAhmLE4+q8aJBJ8V71pjdnp+YOxSX+zKZS22mqXDUCS6SpOg8eDAujnFPbi5vxUdS65bmhupTMuCmV2a5j/YK2Da5cM0rDK9ROmlyOoWGHQPHbfAPm5fMY6hP3hffAgMBAAECggEAD/2+qiAdpfKOJ57mSBD/su7o7b9kCcpOhfUabpaS7E39MM83eEgBnGGLOBFVXzPJg+K0PJD+5xjJxUfadR2peR85Oo1zHvBuB52CuqjneJcdOZIdPwtpr9ZE8xtFM8KtLpZ6oDDMJd2/kc5H1aSiiKC3txjKeWTSQkWyI4vSpSBjRCu0u5MnA6d4RUxbe1I4mZC86aJygquHs3CMRIMYPo3k9dn1YmW7UghCGkNLjvJZX3e6MTIrWRxFbnnrgaIRpEaPDV0Rk63rXHfQP/qlS/MJSOOAsMXTYICuk+PVc4wC2Qq98aUayOtPNl1wF/N9x1JYYnG9LegQhAxY0/v6iQKBgQDzDIWHbgZO3o4ibQokNjpah0O98mti5m3iMXT3FspKPdy3RVhHa9Juk/aLAZT6NQEGL8BdRAGDfrBdoBk/EkOLUdQReMKrcTMJH3BSETb3fq/yZMCVtKgSpd8eqKq9q2VXQLzeyXOhERrWP+9Ko0raZ4/B+PtGByBC9KXheZzCDQKBgQDITRGtq5cNXITMiptRKZ4UNEfA/lCiyGXHJUfb1HRO/f09gniR9F+Rm9rMzqD4atbb2bb53djTyqpz2lXP1lV8ar1YAa0lHWvwRgQ28YcB3YLnBu/j3tX2jYEjYBaaT+v74L+Nze/d66xxE06hItlKddSTS0KacQj9+KLXCJKCmwKBgQCVdofO5tw+OCKUDRYFesubzD7eWmurYCUGyn8xS/SOf0hx89T75tR7Z8ZfaVOiImJE2aykLiP4Jzpx+PhNjv+2d1XAgNDF+VD3NTwvW6K/xEqS915vMa+B+DsjcXm+Nd6WL5t2LdBLpmcohhyze4OWl8UR9fkf8VXnludDpzO9KQKBgEIYfG7somm8T+4XBu2faBSOs+bRhNZSfpNaj/3Qe5jdY0V62kJ/e1HXNjpDLQcMal4d161YMYah5+FW+N4eghMOPfDejL4kmUuuLxHaXYyWBe4qcdql28ECLMz5ljvRh7OUFGG8xRxb+olNr7Kohz905nK8cPv5tNfpxgJjR8VlAoGASUGqBKvGzld32abLOg93FebHFB0cJoxkrbfx7Fw98JIHLZABk6FuzxiO1I4fsUSXRzMOj9E6kT171z/1ocpBsikoUvtPcc1mazgNFf1fMer12BM/QFY7qdfibBuVU+ClGmj8bd3lahhWsvO4xCtoNJhaJ7bnqsrSjHxf+XBA7Fk="
        
        let themeColor: UIColor =  UIColor(hexString: color)
        
        // 按钮圆角
        let corner = Float(bncornerField.text?.trimSpace ?? "") ?? 4
        // 按钮背景
        let bnBgColor = bnColorField.text?.trimSpace ?? ""
        var bgColor = UIColor(hexString: "#3EAEFF")
        if !bnBgColor.isEmpty {
            bgColor = UIColor(hexString: bnBgColor)
        }
        if let gradeColor = gradeColor {
            bgColor = gradeColor
        }
        
        // 按钮字体颜色
        let bnTitleColor = bnTitleColorField.text?.trimSpace ?? ""
        var titleColor = UIColor.white
        if !bnTitleColor.isEmpty {
            titleColor = UIColor(hexString: bnTitleColor)
        }
        
        let bnSetting = ButtonSetting(bgColor: bgColor, circle: CGFloat(corner), color: titleColor)
        VerifyBlocManager.shared.buttonSetting = bnSetting
        VerifyBlocManager.shared.themeColor = themeColor
        if let languageCode = languageField.text?.trimSpace {
            VerifyBlocManager.language(code: languageCode)
        }
        VerifyBlocManager.config(appId: appId, parterId: parterId, secret: secret)
        VerifyBlocManager.setEnv(env: .DEV)
        VerifyBlocManager.verify(userId: userId, verityType: verifyType, presentingController: self) { [weak self] flowId, status in
            self?.dealBlock(flowId: flowId, status)
        }
        
    }
    
    private func dealBlock(flowId: String, _ status: String) {
        var text = textView.text ?? ""
        if !text.isEmpty {
            text += "\n"
        }
        text += "flowId: \(flowId), status: \(status)"
        textView.text = text
    }
    
    @objc private func gradeAction(_ sender: UIButton) {
        if sender.tag == 1024 {
            gradeColor = UIColor(patternImage: UIImage(named: "grade_1_bg")!)
        } else if sender.tag == 1025 {
            gradeColor = UIColor(patternImage: UIImage(named: "grade_2_bg")!)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension String {
    var trimSpace:String {
        let whitespace = NSCharacterSet.whitespaces
        return self.trimmingCharacters(in: whitespace)
    }
}

