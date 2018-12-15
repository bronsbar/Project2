//
//  ViewController.swift
//  Project2
//
//  Created by Bart Bronselaer on 15/12/2018.
//  Copyright © 2018 Bart Bronselaer. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet var guess: NSTextField!
    
    @IBOutlet var tableView: NSTableView!
    var cowsAndBullsGame = CowsandBullsGame()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        print(cowsAndBullsGame.answer)

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func submitGuess(_ sender: NSButton) {
        let userGuess = guess.stringValue
        guard cowsAndBullsGame.submitGuess(inputguess: userGuess) else {return}
        tableView.insertRows(at: IndexSet(integer: 0), withAnimation: .slideDown)
        let resultString = cowsAndBullsGame.result(for: userGuess)
        print(resultString)
        guess.stringValue = ""
        if resultString.contains("4b") {
            let alert = NSAlert()
            alert.messageText = "You Win"
            alert.informativeText = "Congratulations! Click OK to play again."
            alert.runModal()
            startNewGame()
        }
        }
        
        

 
    func numberOfRows(in tableView: NSTableView) -> Int {
        return cowsAndBullsGame.guesses.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw =  tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil}
        if tableColumn?.title == "Guess" {
            vw.textField?.stringValue = cowsAndBullsGame.guesses[row]
        } else {
            vw.textField?.stringValue = cowsAndBullsGame.result(for: cowsAndBullsGame.guesses[row])
        }
    
        return vw
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return false
    }
    
    func startNewGame() {
        cowsAndBullsGame.startNewGame()
        guess.stringValue = ""
        tableView.reloadData()
    }
    
}

