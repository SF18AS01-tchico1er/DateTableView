//
//  DateTableViewController.swift
//  DateTableView
//
//  Created by TIEGO Ouedraogo on 2/27/19.
//  Copyright © 2019 TIEGO Ouedraogo. All rights reserved.
//

import UIKit

class DateTableViewController: UITableViewController {
    var classDates: [String] = [String]();   //the model
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create an array of eight Ints, giving the length in hours of each weekday's class.
        let length: [Int] = [
            0,   //unused
            0,   //Sunday
            3,   //Monday
            0,   //Tuesday
            3,   //Wednesday
            0,   //Thursday
            0,   //Friday
            6    //Saturday
        ];
        
        //Create an array of ten tuples.  Each tuple contains three Ints.
        let tuples: [(year: Int, month: Int, day: Int)] = [
            (2018, 11, 12),   //Mon Veterans Day
            (2018, 11, 21),   //Wed Thanksgiving Eve
            (2018, 11, 24),   //Sat Thanksgiving
            (2018, 12, 22),   //Sat
            (2018, 12, 24),   //Mon Christmas Eve
            (2018, 12, 26),   //Wed Day after Christmas
            (2018, 12, 29),   //Sat
            (2018, 12, 31),   //Mon New Year's Eve
            (2019,  1, 21),   //Mon Martin Luther King
            (2019,  2, 18)    //Mon Presidents Day
        ];
        
        let calendar: Calendar = Calendar.current;   //our Gregorian calendar
        
        //Create an array of ten Date objects.
        let holidays: [Date] = tuples.map {
            calendar.date(from: DateComponents(year: $0.year, month: $0.month, day: $0.day))!;
        };
        
        //Create the starting date for the course, October 10, 2018.
        let dateComponents: DateComponents = DateComponents(year: 2018, month: 10, day: 10);
        var date: Date = calendar.date(from: dateComponents)!;
        
        let dateFormatter: DateFormatter = DateFormatter();
        dateFormatter.dateFormat = "EEE, MMM dd, yyyy";
        var hours: Int = 0;
        
        while hours < 270 {   //Keep going until we have amassed 270 hours of classroom time.
            if !holidays.contains(date) {       //If this date is not on the list of holidays,
                //weekday is an Int in the range 1 to 7 inclusive.  1 means Sun, 2 means Mon, etc.
                let weekday: Int = calendar.component(Calendar.Component.weekday, from: date);
                
                if length[weekday] > 0 {        //If we have class on this day,
                    hours += length[weekday];   //means hours = hours + length[weekday];
                    print(hours, dateFormatter.string(from: date));
                }
            }
            date = calendar.date(byAdding: .day, value: 1, to: date)! //Go to the next date.
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        classDates.append("\(hours) \(dateFormatter.string(from: date))");
    }
  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return classDates.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = classDates[indexPath.row];

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
