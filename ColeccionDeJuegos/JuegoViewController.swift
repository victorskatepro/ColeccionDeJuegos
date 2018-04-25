//
//  JuegoViewController.swift
//  ColeccionDeJuegos
//
//  Created by Mac Tecsup on 25/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class JuegoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var JuegoImageView: UIImageView!
    @IBOutlet weak var tituloTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func fotosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imagenSelecionada = info[UIImagePickerControllerOriginalImage] as! UIImage
        JuegoImageView.image = imagenSelecionada
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func camaraTapped(_ sender: Any) {
    }
    @IBAction func agregarTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let juego = Juego(context: context)
        juego.titulo = tituloTextField.text
        juego.imagen = UIImagePNGRepresentation(JuegoImageView.image!) as Data?
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
            navigationController!.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
