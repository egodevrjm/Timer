//
//  ViewController.swift
//  Timer
//
//  Created by Ryan Morrison on 31/01/2018.
//  Copyright © 2018 Ryan Morrison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var minutes: [Int] = [Int]();
    var seconds: [Int] = [Int]();
    var timer: Timer = Timer();
    
    var minsX = 0;
    var secsX = 0;
    var time = 0;
    
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var timePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetData();
        timerLbl.text = "00:00";
    }
    
    func SetData(){
        timePicker.dataSource = self;
        timePicker.delegate = self;
        
        minutes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        seconds = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55];
    }

    
    @IBAction func refresh(_ sender: Any) {
        timer.invalidate();
        timerLbl.text = "00:00";
        minsX = 0;
        secsX = 0;
    }
    
    @IBAction func pause(_ sender: Any){
        timer.invalidate();
    }
    
    @IBAction func plusTen(_ sender: Any){
        time += 10;
        ShowTime();
    }
    
    @IBAction func play(_ sender: Any){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.DecrementTimer), userInfo: nil, repeats: true)
    }
    
    @objc func DecrementTimer(){
        if(time > 0){
            time -= 1;
            ShowTime();
        } else {
            timer.invalidate();
        }
    }
    
    func ShowTime(){
        let minutes = time / 60 % 60;
        let seconds = time % 60;
        timerLbl.text = String(format: "%02i:%02i", minutes, seconds);
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return minutes.count;
        } else {
            return seconds.count;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return String(minutes[row]);
        } else {
            return String(seconds[row]);
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0){
            switch row {
            case 0:
                minsX = 0;
            case 1:
                minsX = 1;
            case 2:
                minsX = 2;
            case 3:
                minsX = 3;
            case 4:
                minsX = 4;
            case 5:
                minsX = 5;
            case 6:
                minsX = 6;
            case 7:
                minsX = 7;
            case 8:
                minsX = 8;
            case 9:
                minsX = 9;
            case 10:
                minsX = 10;
            default:
                break;
            }
        } else {
            switch row {
            case 0:
                secsX = 0;
            case 1:
                secsX = 5;
            case 2:
                secsX = 10;
            case 3:
                secsX = 15;
            case 4:
                secsX = 20;
            case 5:
                secsX = 25;
            case 6:
                secsX = 30;
            case 7:
                secsX = 35;
            case 8:
                secsX = 40;
            case 9:
                secsX = 45;
            case 10:
                secsX = 50;
            case 11:
                secsX = 55;
            default:
                break;
            }
        }
        
        let timerString = String(format: "%02i:%02i", minsX, secsX);
        timerLbl.text = timerString;
        time = minsX * 60 + secsX;
    }
    
}

