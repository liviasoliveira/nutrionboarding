//
//  ViewController.swift
//  Nutri
//
//  Created by Lívia Silva Oliveira on 02/03/20.
//  Copyright © 2020 Lívia Silva Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
//    let tableview: UITableView = {
//        let tv = UITableView()
//        tv.backgroundColor = UIColor.white
//        tv.translatesAutoresizingMaskIntoConstraints = false
//        return tv
//    }()
//
//    func setupTableView() {
//        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
//
//        view.addSubview(tableview)
//    }
    
    
    //Collection One
    @IBOutlet var estadoDoAlimento: UITextField!
    @IBOutlet var modoDePreparo: UITextField!
    @IBOutlet var labelMacarrao: UILabel!
    @IBOutlet var pesoMacarrao: UITextField!
    @IBOutlet var pessoasMacarrao: UITextField!
    @IBAction func calcularMacarrao(_ sender: UIButton) {
        var resultadoMacarrao = calcularTempo(peso: pesoMacarrao.text!, pessoas: pessoasMacarrao.text!)
        if estadoDoAlimento.text == "Congelado" {
            resultadoMacarrao = resultadoMacarrao + 20
        }
        
        //exibir(resultado: resultadoMacarrao, final: finalMacarrao)
        
        let tempoCalculado = String(resultadoMacarrao) + " minutos"
        
        sender.setTitle(tempoCalculado, for:.normal)
    }
    //setTitle é uma das funcoes para mudar o texto do botao com o toque.
    
    
    var estadoPicker1 = UIPickerView()
    var modoPicker1 = UIPickerView()
    
    let estado = ["Cru", "Congelado"]
    let modo = ["Assado", "Cozido", "Cru"]
    
    
    
    //Collection Two
    @IBOutlet var labelTomate: UILabel!
    @IBOutlet var estadoDoAlimento2: UITextField!
    @IBOutlet var pesoTomate: UITextField!
    @IBOutlet var pessoasTomate: UITextField!
    @IBOutlet var modoDePreparo2: UITextField!
    @IBOutlet var tomateButton: UIButton!
    @IBAction func calcularTomate(){
        var resultadoTomate = calcularTempo(peso: pesoTomate.text!, pessoas: pessoasTomate.text!)
        if  estadoDoAlimento.text == "Congelado" {
            resultadoTomate = resultadoTomate + 20
        }
        
        //exibir(resultado: resultadoTomate, final: finalTomate)
        
        let tempoCalculado = String(resultadoTomate) + " minutos"
        
        tomateButton.setTitle(tempoCalculado, for:.normal)
        
    }
    //Collection Three
    @IBOutlet var macarraoView: UIView!
    @IBOutlet var estadoDoAlimento3: UITextField!
    @IBOutlet var modoDePreparo3: UITextField!
    @IBOutlet var tomateView: UIView!
    @IBOutlet var cebolaView: UIView!
    @IBOutlet var labelCebola: UILabel!
    @IBOutlet var pesoCebola: UITextField!
    @IBOutlet var pessoasCebola: UITextField!
    @IBOutlet var cebolaButton: UIButton!
    @IBAction func calcularCebola() {
        var resultadoCebola = calcularTempo(peso: pesoCebola.text!, pessoas: pessoasCebola.text!)
        if  estadoDoAlimento.text == "Congelado" {
            resultadoCebola = resultadoCebola + 20
        }
        
        
        //exibir(resultado: resultadoCebola, final: finalCebola). Colocaria isso se precisasse da label para exibir!
        
        let tempoCalculado = String(resultadoCebola) + " minutos"
        
        cebolaButton.setTitle(tempoCalculado, for:.normal)
        
    }
    
    @IBAction func tocarTela(_ sender: Any) {
        self.pesoMacarrao.resignFirstResponder()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // setupTableView()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        
        
        
        self.pesoMacarrao.delegate = self
        self.estadoPicker1.delegate = self
        self.estadoPicker1.dataSource = self
        self.modoPicker1.delegate = self
        self.modoPicker1.dataSource = self
        
        //Arredondar as views
        macarraoView.layer.cornerRadius = 12
        tomateView.layer.cornerRadius = 12
        cebolaView.layer.cornerRadius = 12
        
        //Indicar que o textfield é um pickerview
        estadoDoAlimento.inputView = estadoPicker1
        estadoDoAlimento2.inputView = estadoPicker1
        estadoDoAlimento3.inputView = estadoPicker1
        modoDePreparo.inputView = modoPicker1
        modoDePreparo2.inputView = modoPicker1
        modoDePreparo3.inputView = modoPicker1
        
        
        //Indicar que a extensão do teclado numérico, tem o botão "ok". Nesse caso, estou indicando que onde vai aparecer.
        pesoMacarrao.addDoneButtonToKeyboard(myAction: #selector(self.pesoMacarrao.resignFirstResponder))
        
        pessoasMacarrao.addDoneButtonToKeyboard(myAction: #selector(self.pesoMacarrao.resignFirstResponder))
        
        pesoTomate.addDoneButtonToKeyboard(myAction: #selector(self.pesoTomate.resignFirstResponder))
        
        pessoasTomate.addDoneButtonToKeyboard(myAction: #selector(self.pessoasTomate.resignFirstResponder))
        
        pesoCebola.addDoneButtonToKeyboard(myAction: #selector(self.pesoCebola.resignFirstResponder))
        
        pessoasCebola.addDoneButtonToKeyboard(myAction: #selector(self.pessoasCebola.resignFirstResponder))
        
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue

        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    // "?? 0" representa para o código que não precisará de um valor para peso e pessoas para que haja um valor final em calcular tempo. Evita bug.
    
    func calcularTempo(peso: String, pessoas: String) -> Int {
        // Transformar texto em Int
        let pesoInt: Int
        pesoInt = Int(peso) ?? 0
        
        // Transformar texto em Int
        let pessoasInt: Int
        pessoasInt = Int(pessoas) ?? 0
        
        let calcularTempo = (pesoInt * pessoasInt) + 15
        
        
        return calcularTempo
        
    }
    
    func exibir(resultado: Int, final: UILabel) {
        // Escreve na label de resultados o valor calculado em anos
        final.text = String (resultado)
    }
    
    func tempoTotaldoVisor() {
        // Mostrar tempo total de preparo
        // Aparecer "Pá-Pum!"
    }
    
    func apagarCollection() {
        // Se apertar no "X" os dados escritos da collection será apagado
    }
    
    func voltarparaTelaInicial() {
        // Se clicar fora da tela de cadastro, será redirecionado para a tela inicial
    }
   
    @IBAction func buttonTapReturn() {
        macarraoView.alpha = 1
        tomateView.alpha = 1
        cebolaView.alpha = 1
    }
    
    // Função para ocultar as outras collections e só deixar macarrão
    @IBAction func toqueDoMacarrao(_ sender: UITextField) {
        tomateView.alpha = 0.5
        cebolaView.alpha = 0.5
        
        if macarraoView.alpha == CGFloat(0.5){
            macarraoView.alpha = 1
        }
    }
    
    // Função para ocultar as outras collections e só deixar tomate
    @IBAction func toqueDoTomate(_ sender: UITextField) {
        macarraoView.alpha = 0.5
        cebolaView.alpha = 0.5
        
        if tomateView.alpha == CGFloat(0.5){
            tomateView.alpha = 1
        }
        
    }
    
    // Função para ocultar as outras collections e só deixar cebola
    @IBAction func toqueDaCebola(_ sender: UITextField) {
        macarraoView.alpha = 0.5
        tomateView.alpha = 0.5
        
        if cebolaView.alpha == CGFloat(0.5){
            cebolaView.alpha = 1
        }
        
    }
    
    // Picker. Lembrar que esse return retorna a quantidade de colunas. O numero de componentes diz quantas colunas e linhas terao para cada picker.

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == estadoPicker1{
            return 1
        }
        else{
            return 1
        }
    }
    // Count significa a quantidade de arrays que eu coloquei, por exemplo, cru, congelado etc.
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == estadoPicker1{
            return estado.count
        }
        else{
            return modo.count
        }
        
    }
    
    //Conexao do pickerview com o array que são
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component:Int) -> String? {
        if pickerView == estadoPicker1{
            return estado[row]
        }
        else{
            return modo[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component:Int){
        if estadoDoAlimento.isEditing {
            estadoDoAlimento.text = estado[row]
        } else if modoDePreparo.isEditing{
            modoDePreparo.text = modo[row]
            
        } else if modoDePreparo2.isEditing{
            modoDePreparo2.text = modo[row]
            
        }
        else if modoDePreparo3.isEditing{
            modoDePreparo3.text = modo[row]
        }
        else if estadoDoAlimento2.isEditing{
            estadoDoAlimento2.text = estado[row]
        }
            //if estadoDoAlimento3.isEditing (caso usasse else if, que tambem estaria certo)
        else {
            estadoDoAlimento3.text = estado[row]
        }
    }
    
    
    
}

// Extensão para o protocolo de TextField que haverá um botão "ok" toda vez que aparecer o teclado numérico.
extension UITextField{
    
    func addDoneButtonToKeyboard(myAction:Selector?){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        doneToolbar.barStyle = UIBarStyle.default
        
        doneToolbar.backgroundColor = UIColor.white
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "OK", style: UIBarButtonItem.Style.done, target: self, action: myAction)
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    
}

