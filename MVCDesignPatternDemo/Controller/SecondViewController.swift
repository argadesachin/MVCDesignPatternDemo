//
//  SecondViewController.swift
//  MVCDesignPatternDemo
//
//  Created by Mac on 04/11/22.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var empIdTextField: UITextField!
    @IBOutlet weak var empFirstNameTextField: UITextField!
    @IBOutlet weak var empLastNameTextField: UITextField!
    @IBOutlet weak var empSalaryTextField: UITextField!
   
    
    var delegateOnSecondViewController : BackDataPassingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func clickBtnToAddEmployeeRecord(_ sender: UIButton) {
        guard let delegate = delegateOnSecondViewController else{
            print("delegate not created")
            return
        }
        
        let id = self.empIdTextField.text
        let idInt = Int(id!) ?? 0
        
        let empFirstName = self.empFirstNameTextField.text ?? "Default FN"
        let empLastName = self.empLastNameTextField.text ?? "Default LN"
        let Salary = self.empSalaryTextField.text
        let empSalary = Float(Salary!) ?? 0.0
        
        delegate.passingDataToFirstViewController(employee:Employee(empId:idInt,
                                                                    empFirstName:empFirstName,
                                                                    empLastName:empLastName,
                                                                    empSalary:empSalary))
        navigationController?.popViewController(animated: true)
    }
}
