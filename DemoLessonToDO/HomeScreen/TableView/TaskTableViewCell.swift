//
//  TaskTableViewCell.swift
//  DemoLessonToDO
//
//  Created by Nihad Allahveranov on 10.03.23.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    var item: [Int: Task]?
    
    let viewModel = HomeViewModel()
    
    @IBOutlet weak var taskTitleLbl: UILabel!
    @IBOutlet weak var completedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ item: Task, _ index: Int) {
        self.item = [index: item]
        taskTitleLbl.text = item.title
        setImageToCompletedButton(item: item)
    }
    
    @IBAction func didTappedCompletedButton() {
        if let item = item {
            viewModel.toggleTaskCompletion(at: item.keys.first!)
            setImageToCompletedButton(item: item.values.first!)
        }
    }
    
    func setImageToCompletedButton(item: Task) {
        print(item.isCompleted)
        completedButton.setImage(item.isCompleted ? UIImage(systemName: "checkmark") : UIImage(systemName: "xmark"), for: .normal)
    }

}
