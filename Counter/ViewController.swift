//
//  ViewController.swift
//  Counter
//
//  Created by Денис Кель on 01.09.2024.
//

import UIKit

class ViewController: UIViewController {
    // Добавили дополнительные переменные для счета и сообщения
    var count = 0
    var message = ""
    //связали элементы
    @IBOutlet weak var textHistory: UITextView!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var buttonIncraseOne: UIButton!
    @IBOutlet weak var textCount: UILabel!
    //функция для обновления отображения и заполнения истории
    func refreshUI(_: Int, _:String) {
        textCount.text = String(format: "%0", count)
        textCount.text = "Значение счетчика: \(count)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd hh:mm:ss"
        let dateString = dateFormatter.string(from: Date.init())
        textHistory.text += "\(dateString): \(message)\n"
    }
    // первоначальное создание элементов
    override func viewDidLoad() {
        super.viewDidLoad()
        textCount.text! += String(count)
        buttonIncraseOne.backgroundColor = .gray
        buttonPlus.backgroundColor = .red
        buttonMinus.backgroundColor = .blue
        buttonReset.backgroundColor = .magenta
        textHistory.text = "История изменений: \n"
    }
    //сброс счетчика по нажатию кнопки
    @IBAction func buttonResetTap(_ sender: Any) {
        count = 0
        message = "значение сброшено"
        refreshUI(count, message)
    }
    //увеличение счетчика на 1
    @IBAction func buttonPlusTap(_ sender: Any) {
        count += 1
        message = "значение изменено на +1"
        refreshUI(count, message)
    }
    //уменьшение счетчика на 1 и проверка значения на ноль
    @IBAction func buttonMinusTap(_ sender: Any) {
        if count > 0 {
            count -= 1
            message = "значение изменено на -1"
            refreshUI(count, message)
        } else {
            message = "попытка уменьшить значение счётчика ниже 0"
            refreshUI(count, message)
        }
    }
    
}

