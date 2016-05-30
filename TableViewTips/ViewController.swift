//
//  ViewController.swift
//  TableViewTips
//
//  Created by 赵晓东 on 16/5/30.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createNav()
        
        self.createView()
    }
    
    //创建头部
    func createNav() {
        //设置页面背景
        self.view.backgroundColor = UIColor.whiteColor()
        
        //设置导航不透明
        self.navigationController?.navigationBar.translucent = false
        
        //设置导航的标题
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:RGBA (255.0, g:255.0, b: 255.0, a: 1),NSFontAttributeName:UIFont.systemFontOfSize(18)]
        self.navigationItem.title = "tableView cell 动画"
        
        //设置导航背景图
        self.navigationController?.navigationBar.barTintColor = RGBA (86.0, g:173.0, b: 216.0, a: 1)
    }
    
    //创建页面
    func createView() {

    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        //cell.selectionStyle = UITableViewCellSelectionStyle.None//点击不选中 状态
        
        let bottomView = cell.contentView.viewWithTag(2000)
        let imageView = bottomView?.viewWithTag(3000)
        let rect = bottomView?.convertRect((bottomView?.bounds)!, toView: nil)
        var Y = HEIGHT - (rect?.origin.y)! - 600
        Y*=0.2
        if Y > 0 {
            Y = 0
        }
        if Y < -100{
            Y = -100
        }
        imageView?.frame.origin.y = Y
        
        
        return cell
    }
    
    //返回 cell 高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 300
    }




    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        for cell in self.tableView.visibleCells {
            //页面上显示的cell的动画
            let bottomView = cell.contentView.viewWithTag(2000)
            let imageView = bottomView?.viewWithTag(3000)
            let rect = bottomView?.convertRect((bottomView?.bounds)!, toView: nil)
            var Y = HEIGHT - (rect?.origin.y)! - 600
            Y*=0.2
            if Y > 0 {
                Y = 0
            }
            if Y < -100{
                Y = -100
            }
            imageView?.frame.origin.y = Y
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

