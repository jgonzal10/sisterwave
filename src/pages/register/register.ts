import { Component } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { IonicPage, NavController, ToastController } from 'ionic-angular';

import { User } from '../../providers/providers';
import { MainPage } from '../pages';



@IonicPage()
@Component({
  selector: 'page-register',
  templateUrl: 'register.html',
})
export class RegisterPage {
  private registerErrorString: string;
  account: { name: string, surname:string, email: string,nickname:string, password: string } = {
    name: 'marta',
    surname:'lima',
    email: 'test@example.com',
    nickname:'lima',
    password: 'test'
  };

  constructor(public navCtrl: NavController,
    public user: User,
    public toastCtrl: ToastController,
    public translateService: TranslateService) {

    this.translateService.get('LOGIN_ERROR').subscribe((value) => {
      this.registerErrorString = value;
    })
  }


    doRegistration() {
    this.user.login(this.account).subscribe((resp) => {
      this.navCtrl.push(MainPage);
    }, (err) => {
      this.navCtrl.push(MainPage);
      // Unable to log in
      let toast = this.toastCtrl.create({
        message: this.registerErrorString,
        duration: 3000,
        position: 'top'
      });
      toast.present();
    });
  }



}
