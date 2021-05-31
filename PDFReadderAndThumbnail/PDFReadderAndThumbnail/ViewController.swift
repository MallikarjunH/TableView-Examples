//
//  ViewController.swift
//  PDFReadderAndThumbnail
//
//  Created by EOO61 on 24/05/21.
//

import UIKit
import PDFKit
import QuartzCore

class ViewController: UIViewController {
    
    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var signAndSendBGVIew: UIView!
    
    @IBOutlet weak var thumbnailTableView: UITableView!
    var totalPageOfPdf = 0
    var thumbnailArrayForCurrentPDF:[UIImage] = []
    
    var presentSelectedDocument:PDFDocument = PDFDocument()
    
    @IBOutlet weak var sidebarLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var thumnailWidthContraint: NSLayoutConstraint!
   
    @IBOutlet weak var showHideThumbnailViewButtonOutlet: UIButton!
    let animationDuration: TimeInterval = 0.25
    var firstOrLastPageCheck = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.thumnailWidthContraint.constant = 0
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handlePageChange(notification:)),
            name: Notification.Name.PDFViewPageChanged,
            object: self.pdfView)
        
        view.addSubview(pdfView)
        
      //  self.pdfView.addSubview(thumbnailTableView)
        
        self.loadPDF()
    }

    @objc private func handlePageChange(notification: Notification)
    {
        //self.pdfView.currentPage?.pageRef?.pageNumber ?? 0
        print("Current Page of PDF is: \((self.pdfView.currentPage?.pageRef?.pageNumber ?? 1 - 1) )")
        //print("Page \(self.pdfView.currentPage!.label!) of \(self.pdfView.document!.pageCount)")
    }
    
    func loadPDF() {
      
        guard let path = Bundle.main.url(forResource: "SK-traditional-medicine", withExtension: "pdf") else { return }
        
        if let document = PDFDocument(url: path) {
            
            pdfView.displayMode = .singlePage
            pdfView.autoScales = true // Fit content in PDFView.
            pdfView.displayDirection = .vertical
            pdfView.usePageViewController(true, withViewOptions: [:])
            pdfView.document = document
            
            presentSelectedDocument = document //test to testing
            
            print("Total Pages in PDF : ",document.pageCount);
            totalPageOfPdf = document.pageCount
            
            self.pdfView.addSubview(showHideThumbnailViewButtonOutlet)
            
            let thumbnailSize = CGSize(width: 85, height: 85)
            self.thumbnailArrayForCurrentPDF.removeAll()
            for item in 1...totalPageOfPdf{
               // print("Item is: \(item)")
                
                let thumbnail = generatePdfThumbnail(of: thumbnailSize, for: path, atPage: item-1)!
                self.thumbnailArrayForCurrentPDF.append(thumbnail)
            }
        }
    }
    
    func generatePdfThumbnail(of thumbnailSize: CGSize , for documentUrl: URL, atPage pageIndex: Int) -> UIImage? {
        let pdfDocument = PDFDocument(url: documentUrl)
        let pdfDocumentPage = pdfDocument?.page(at: pageIndex)
        return pdfDocumentPage?.thumbnail(of: thumbnailSize, for: PDFDisplayBox.trimBox)
    }
    
   // let thumbnailSize = CGSize(width: 100, height: 100) //80-80
   // let thumbnail = generatePdfThumbnail(of: thumbnailSize, for: url, atPage: 0)
    
    @IBAction func showOrHideThumbnailViewMethod(_ sender: Any) {
        
        let isShowingThumbnailView = self.thumnailWidthContraint.constant == 0
        
        UIView.animate(withDuration: animationDuration) {
            if isShowingThumbnailView {
                print("true")
                self.thumnailWidthContraint.constant = 80
            }else{
                print("false")
                self.thumnailWidthContraint.constant = 0
            }
            self.view.layoutIfNeeded()
        }
    }
}
 
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalPageOfPdf
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThumbnailTableViewCell") as! ThumbnailTableViewCell
        cell.thumbnailImg.image = self.thumbnailArrayForCurrentPDF[indexPath.row]
        cell.pageNumberLabel.text = "\(indexPath.row+1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Page is: \(indexPath.row + 1)")
        //check first/last page
        
        firstOrLastPageCheck = ""
        if indexPath.row + 1 == 1 {
            firstOrLastPageCheck = "first"
        }
        
        DispatchQueue.main.async {
           
            if let pageNumberToGo = self.pdfView.document?.page(at: indexPath.row) {
                if self.firstOrLastPageCheck == "first" {
                    self.pdfView.goToFirstPage(self)
                }else{
                    self.pdfView.go(to: pageNumberToGo)
                }
                
             }
        }
        
        
    }
    
}
