//
//  APIErrorGenerator.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import UIKit

public class APIErrorGenerator{
    func generateError(error: BaseErrorModel) -> String{
        var alertText = ""
        if error.errors != nil{
            for errorModel in error.errors!{
                if errorModel.field == APIErrors.Service.rawValue{
                    alertText += errorModel.message ?? ""
                }
                else if errorModel.field! == APIErrors.Fatal.rawValue{

                    (UIApplication.shared.delegate as! AppDelegate).window = UIWindow(frame: UIScreen.main.bounds)
                    (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = SplashRouterInput().view(entryEntity: SplashEntryEntity())
                    (UIApplication.shared.delegate as! AppDelegate).window?.makeKeyAndVisible()
                }
            }
        }
        else if error.message != nil{
            alertText = error.message!
        }
        
        if alertText == ""{
            alertText = "Bilinmeyen bir hata oluştu."
        }
        
        return alertText
    }
}
