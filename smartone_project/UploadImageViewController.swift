//
//  UploadImageViewController.swift
//  smartone_project
//
//  Created by Marcus Man on 21/10/2017.
//  Copyright © 2017 Marcus Man. All rights reserved.
//

import UIKit
import YangMingShan

class UploadImageViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, YMSPhotoPickerViewControllerDelegate, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var bar: UIImageView!
    @IBOutlet weak var rightCaption: UITextField!
    @IBOutlet weak var leftCaption: UITextField!
    @IBOutlet weak var questionName: UITextView!
    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!

    var images: NSArray! = []

    func photoPickerViewControllerDidReceivePhotoAlbumAccessDenied(_ picker: YMSPhotoPickerViewController!) {
        let alertController = UIAlertController(title: "Allow photo album access?", message: "Need your permission to access photo albums", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (action) in
            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
        }
        alertController.addAction(dismissAction)
        alertController.addAction(settingsAction)

        self.present(alertController, animated: true, completion: nil)
    }

    func photoPickerViewControllerDidReceiveCameraAccessDenied(_ picker: YMSPhotoPickerViewController!) {
        let alertController = UIAlertController(title: "Allow camera album access?", message: "Need your permission to take a photo", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (action) in
            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)
        }
        alertController.addAction(dismissAction)
        alertController.addAction(settingsAction)

        // The access denied of camera is always happened on picker, present alert on it to follow the view hierarchy
        picker.present(alertController, animated: true, completion: nil)
    }

    func photoPickerViewController(_ picker: YMSPhotoPickerViewController!, didFinishPickingImages photoAssets: [PHAsset]!) {
        // Remember images you get here is PHAsset array, you need to implement PHImageManager to get UIImage data by yourself
        picker.dismiss(animated: true) {
            let imageManager = PHImageManager.init()
            let options = PHImageRequestOptions.init()
            options.deliveryMode = .highQualityFormat
            options.resizeMode = .exact
            options.isSynchronous = true

            let mutableImages: NSMutableArray! = []
            print("@@@@@@@@")

            for asset: PHAsset in photoAssets
            {
                let scale = UIScreen.main.scale
                print("scale: \(scale)")
                let targetSize = CGSize(width:(self.view.frame.height - 20*2) * scale, height:(self.view.frame.width - 20*2) * scale)
                imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: options, resultHandler: { (image, info) in
                    mutableImages.add(image!)
                })
            }

            // Assign to Array with images
            self.images = mutableImages.copy() as? NSArray
            //self.pageControl.numberOfPages = self.images.count

            for i in 0..<self.images.count{

                self.imgView.image = self.images[0] as? UIImage
                self.bar.isHidden = false
                self.leftCaption.isHidden = false
                self.rightCaption.isHidden = false
//                let imageView = UIImageView()
//                imageView.image = self.images[i] as? UIImage
//                //imageView.contentMode = .scaleAspectFit
//                let xPosition = self.view.frame.width * CGFloat(i)
//                imageView.frame = CGRect(x: xPosition, y: 0, width: self.imagePicked.frame.width, height: self.imagePicked.frame.height)
//
//                self.imagePicked.contentSize.width = self.imagePicked.frame.width * CGFloat(i+1)
//                self.imagePicked.addSubview(imageView)


            }

            //bring the scrollView, pagecontrol and cancel button into the top of view
//            self.view.subviews[0].bringSubview(toFront: self.imagePicked)
//            self.view.subviews[0].bringSubview(toFront: self.pageControl)
//            self.view.subviews[0].bringSubview(toFront: self.cancelController)

            // Upload Image to firebase

            //self.uploadImage_firebase(count: self.images.count)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionName.delegate = self
        questionName.text = "Any Questions?"
        questionName.textColor = UIColor.lightGray
        self.leftCaption.delegate = self
        self.rightCaption.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func UploadImage(_ sender: Any) {
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
//            imagePicker.allowsEditing = false
//            self.present(imagePicker, animated: true, completion: nil)
//        }
        let pickerViewController = YMSPhotoPickerViewController.init()
        pickerViewController.numberOfPhotoToSelect = 5

        let customColor = UIColor.init(red: 64.0/255.0, green: 0.0, blue: 144.0/255.0, alpha: 1.0)
        let customCameraColor = UIColor.init(red: 86.0/255.0, green: 1.0/255.0, blue: 236.0/255.0, alpha: 1.0)

        pickerViewController.theme.titleLabelTextColor = UIColor.white
        pickerViewController.theme.navigationBarBackgroundColor = customColor
        pickerViewController.theme.tintColor = UIColor.white
        pickerViewController.theme.orderTintColor = customCameraColor
        pickerViewController.theme.cameraVeilColor = customCameraColor
        pickerViewController.theme.cameraIconColor = UIColor.white
        pickerViewController.theme.statusBarStyle = .lightContent

        self.yms_presentCustomAlbumPhotoView(pickerViewController, delegate: self)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        if(text == "\n")
        {
            view.endEditing(true)
            return false
        }
        else
        {
            return true
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if questionName.textColor == UIColor.lightGray {
            questionName.text = nil
            textView.textColor = UIColor.black
        }
    }
}
