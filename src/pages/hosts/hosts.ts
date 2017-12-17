import { Component } from '@angular/core';
import { IonicPage, NavController, ModalController } from 'ionic-angular';
import { Host } from '../../models/host';
import { Hosts } from '../../providers/providers';
/**
 * Generated class for the HostsPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-hosts',
  templateUrl: 'hosts.html',
})
export class HostsPage {



    currentHosts: Host[];

  constructor(public navCtrl: NavController, public hosts: Hosts, public modalCtrl: ModalController) {
    this.currentHosts = this.hosts.query();
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad HostsPage');
  }


    addHost() {
    let addModal = this.modalCtrl.create('HostCreatePage');
    addModal.onDidDismiss(host => {
      if (host) {
        this.hosts.add(host);
      }
    })
    addModal.present();
  }


  deleteHost(host) {
    this.hosts.delete(host);
  }


  openHost(host: Host) {
    this.navCtrl.push('HostDetailPage', {
      host: host
    });
  }

}
