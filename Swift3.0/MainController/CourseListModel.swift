//
//  CourseListModel.swift
//  Swift3.0
//
//  Created by 巴巴罗萨 on 2016/9/29.
//  Copyright © 2016年 dass. All rights reserved.
//

import UIKit

class CourseListModel: NSObject {
    var PhotoURL : String?
    var SID      : String?
    var CourseID : String?
    var SchoolName : String?
    var CourseName : String?
    var PayEndTime : String?
    var Brief      : String?
    var StudentNumber   : String?
    var PayStudentLimit : String?
    var ClassNumber     : String?
    var TypeA           : String?
    var ClientType      : String?
    var Sort            : String?
    var CreatedTime     : String?
    var Pattern         : String?
    var LinkURL         : String?
    var ShowsStartTime  : String?
    var ShowEndTime     : String?
    var Cost            : String?
    //说明在model类进行解析,在init方法中不需要声明func
    init(params : [String :AnyObject ]) {
        super.init()
        //as 关键字后面加"?" 是进行解包,对可选型
        PhotoURL = params["PhotoURL"] as? String
        SID      = params["SID"] as? String
        CourseID = params["CourseID"] as? String
        SchoolName = params["SchoolName"] as? String
        PayEndTime = params["PayEndTime"] as? String
        Brief = params["Brief"] as? String
        StudentNumber = params["StudentNumber"] as? String
        PayStudentLimit = params["PayStudentLimit"] as? String
        ClassNumber = params["ClassNumber"] as? String
        TypeA = params["Type"] as? String
        ClientType = params["ClientType"] as? String
        Sort = params["Sort"] as? String
        CreatedTime = params["CreatedTime"] as? String
        Pattern = params["Pattern"] as? String
        LinkURL = params["LinkURL"] as? String
        ShowsStartTime = params["ShowsStartTime"] as? String
        ShowEndTime = params["ShowEndTime"] as? String
        Cost = params["Cost"] as? String
        CourseName = params["CourseName"] as? String
    }
    
}
