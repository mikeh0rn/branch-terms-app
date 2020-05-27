//
// ViewController.swift
// Branch Terms
//
// Created by Daniel Berger on 5/26/20.
// Copyright © 2020 Mike Horn. All rights reserved.
//
import UIKit

class DanielViewController: UIViewController {
  //MARK:- initializing and presenting the View Controller to the screen
  override func loadView() {
    // initialize view from code
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // inital view setup or network calls or other one time tasks
  }
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    // change sizing of views
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // after view is in foreground
  }
  //MARK:- removing View Controller from screen
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    // called right before view is removed. De-Init animations, persistent network calls, etc.
  }
  override func viewDidDisappear(_ animated: Bool) {
    // cease notifications
  }
}
