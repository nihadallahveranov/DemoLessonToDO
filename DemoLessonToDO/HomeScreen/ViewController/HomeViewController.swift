//
//  HomeViewController.swift
//  DemoLessonToDO
//
//  Created by Nihad Allahveranov on 06.03.23.
//

import UIKit
import TableViewReloadAnimation

class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainPlanningView: UIView! {
        didSet {
            self.mainPlanningView.layer.borderWidth = 1
            self.mainPlanningView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet weak var linkShareView: UIView!
        
    @IBOutlet weak var dateLbl: UILabel! {
        didSet {
            let date = Date()
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM/dd/yyyy"
            let dates = formatter.string(from: date).split(separator: "/")
            
            dateLbl.text = "\(dates[0]) \(dates[1])th, \(dates[2])"
        }
    }
    
    @IBOutlet weak var taskCountLbl: UILabel! {
        didSet {
            setTaskCountLbl()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.dataSource = self
        tableView.delegate = self
        
        self.reloadTableViewAnimation()
    }
    
    @IBAction func didTappedAddButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
        
        alertController.addTextField()

        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let title = alertController.textFields?.first?.text else { return }
            self?.viewModel.addTask(title: title)
            self?.setTaskCountLbl()
            self?.reloadTableViewAnimation()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func setTaskCountLbl() {
        taskCountLbl.text = "Goals (\(viewModel.tasks.count))"
    }
    
    func reloadTableViewAnimation() {
        self.tableView.reloadData(
                    with: .spring(duration: 0.45, damping: 0.65, velocity: 1, direction: .right(useCellsFrame: false),
                    constantDelay: 0))
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "taskTableViewCell", for: indexPath) as? TaskTableViewCell {
            let item = viewModel.tasks[indexPath.row]
            
            cell.configure(item, indexPath.row)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

            let deleteAction = UIContextualAction(style: .normal, title: nil) {
                (action, view, bool) in
                
                let item = self.viewModel.tasks[indexPath.row]

                let alert = UIAlertController(title: "Deletion Process", message: "Do you want to delete \(item.title) ?", preferredStyle: .alert)

                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                alert.addAction(cancelAction)

                let yesAction = UIAlertAction(title: "Yes", style: .destructive) { action in
                    self.viewModel.removeTask(at: indexPath.row)
                    self.reloadTableViewAnimation()
                    self.setTaskCountLbl()
                }
                
                alert.addAction(yesAction)
                self.present(alert, animated: true)
                
            }

            deleteAction.backgroundColor = UIColor(named: "softWhite")
            deleteAction.image = UIImage(systemName: "trash")?.withTintColor(UIColor(named: "softYellow")!, renderingMode: .alwaysOriginal)

            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
}
