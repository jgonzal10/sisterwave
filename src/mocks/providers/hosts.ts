import { Injectable } from '@angular/core';

import { Host } from '../../models/host';

@Injectable()
export class Hosts {
  hosts: Host[] = [];

  defaultHost: any = {
    "name": "Jennifer",
    "profilePic": "",
    "about": "Colombiana",
  };


  constructor() {
    let hosts = [
      {
        "name": "Claudia",
        "profilePic": "",
        "about": "Minas"
      },
            {
        "name": "Aurora",
        "profilePic": "",
        "about": "Brasilia"
      },
            {
        "name": "Marta",
        "profilePic": "",
        "about": "Rio de Janeiro"
      },
            {
        "name": "Laura",
        "profilePic": "",
        "about": "Natal"
      }

    ];

    for (let host of hosts) {
      this.hosts.push(new Host(host));
    }
  }

  query(params?: any) {
    if (!params) {
      return this.hosts;
    }

    return this.hosts.filter((host) => {
      for (let key in params) {
        let field = host[key];
        if (typeof field == 'string' && field.toLowerCase().indexOf(params[key].toLowerCase()) >= 0) {
          return host;
        } else if (field == params[key]) {
          return host;
        }
      }
      return null;
    });
  }

  add(host: Host) {
    this.hosts.push(host);
  }

  delete(host: Host) {
    this.hosts.splice(this.hosts.indexOf(host), 1);
  }
}
