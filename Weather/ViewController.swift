//
//  ViewController.swift
//  Weather
//
//  Created by David Minasyan on 14/02/2019.
//  Copyright © 2019 David Minasyan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya

class ViewController: UIViewController {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var bag = DisposeBag()
    var forecast = Variable<[List]>([])
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var refreshIndictor: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        delegate.weatherProvider.rx.request(WeatherService.getWeather(city: "Moscow", countryCode: "ru", appid: "2c69572bcd0f105f7aa751ea9561ae1a")).mapObject(WeatherModel.self).subscribe(onSuccess: { (weather) in
            self.forecast.value = weather.list ?? []
            self.refreshIndictor.stopAnimating()
        }) { (err) in
            DispatchQueue.main.async{
                let alert = UIAlertController(title: "Alert", message: err.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: nil))
                self.present(alert, animated: true, completion: {
                    self.refreshIndictor.stopAnimating()
                })
            }
            }.disposed(by: bag)
        forecast.asObservable().bind(to: tableView.rx.items(cellIdentifier: "cell1")) {
            row, model, cell in
            let c = cell as! WeatherCell
            c.temperature.text = String(format:"%.0fºС",round(274.0-(model.main?.temp ?? 274)) == -0 ? 0 : round(274.0-(model.main?.temp ?? 274)))
            c.preassure.text =  String(format:"%.0f мм р.ст.",model.main?.pressure ?? 0)
            c.humidoty.text = String(format: "Влажн. %d%%", model.main?.humidity ?? 50)
            var possibility = "неизвестна"
            print(cell.contentView.frame)
            
            if let pos = model.rain?.the3H ?? model.snow?.the3H {
                if pos > 0.75 {
                    possibility = "высокая"
                } else if pos > 0.5 && pos <= 0.75 {
                    possibility = "средняя"
                } else if pos <= 0.5  {
                    possibility = "низкая"
                }
            }
            c.rain.text = String(format: "Вероятность осадков %@", possibility)
            c.wind.text = String(format: "Ветер %.0f м/с", model.wind?.speed ?? 0)
            c.date.text = model.dtTxt
        }.disposed(by: bag)
    }
}
