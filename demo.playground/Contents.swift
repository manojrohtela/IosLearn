import UIKit

var str = "Hello, playground"


var text = "We are iOS developer [~userId:712341a8d75b42a895ea429cf0c86216], [~userId:6fa6ddfb4e4c47f28f89b3b116a709c3]"
let regex = #"\[.*?\]"#

func matchesForRegexInText(regex: String!, text: String!) -> [String] {
    
    do {
        
        let regex = try NSRegularExpression(pattern: regex, options: [])
        let nsString = text as NSString
        
        let results = regex.matches(in: text,
                                    options: [], range: NSMakeRange(0, nsString.length))
        return results.map { nsString.substring(with: $0.range)}
        
    } catch let error as NSError {
        
        print("invalid regex: \(error.localizedDescription)")
        
        return []
    }
    
}
matchesForRegexInText(regex: regex, text:text)

