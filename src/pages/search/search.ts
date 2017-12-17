import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { Host } from '../../models/host';
import { Hosts } from '../../providers/providers';

@IonicPage()
@Component({
  selector: 'page-search',
  templateUrl: 'search.html'
})
export class SearchPage {

  currentHosts: any = [];

  constructor(public navCtrl: NavController, public navParams: NavParams, public hosts: Hosts) { }

  /**
   * Perform a service for the proper Hosts.
   */
  getHosts(ev) {
    let val = ev.target.value;
    if (!val || !val.trim()) {
      this.currentHosts = [];
      return;
    }
    this.currentHosts = this.hosts.query({
      name: val
    });
  }

  /**
   * Navigate to the detail page for this host.
   */
  openHosts(host: Host) {
    this.navCtrl.push('HostDetailPage', {
      host: host
    });
  }

}
