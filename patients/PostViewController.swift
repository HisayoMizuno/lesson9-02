//
//  PostViewController.swift
//  patients
//
//  Created by 水野 久代 on 2018/08/13.
//  Copyright © 2018年 水野 久代. All rights reserved.
//

import UIKit
import RealmSwift

class PostViewController: UIViewController {
    @IBOutlet weak var weightTextField: UITextField! //体重
    @IBOutlet weak var bloodmaxTextField: UITextField! //血圧上
    @IBOutlet weak var bloodminTextField: UITextField! //血圧下
    @IBOutlet weak var viewname: UILabel!
    @IBOutlet weak var viewsex: UILabel! //性別
    @IBOutlet weak var viewage: UILabel! //年齢
    let realm = try! Realm()
    var userdata:Userdata!
    
    //登録実行
    @IBAction func healthdataAdd(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let health = HealthData(value: [
            "museid"  : 10 ,
            "weight"  : Int(self.weightTextField.text!),
            "bloodmax": Int(self.bloodmaxTextField.text!),
            "bloodmin": Int(self.bloodminTextField.text!)
         ])
        try! realm.write {
            userdata.healthData.append(health)
        }
    }
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewname.text = userdata.name
        viewage.text = String(userdata.age)
        viewsex.text = userdata.sex

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
