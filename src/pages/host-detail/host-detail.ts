import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { Hosts } from '../../providers/providers';

/**
 * Generated class for the HostDetailPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-host-detail',
  templateUrl: 'host-detail.html',
})
export class HostDetailPage {
  host: any;

  constructor(public navCtrl: NavController, navParams: NavParams, hosts: Hosts) {
    this.host = navParams.get('host') || hosts.defaultHost;
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad HostDetailPage');
  }

}
