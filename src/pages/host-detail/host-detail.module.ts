import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { HostDetailPage } from './host-detail';

@NgModule({
  declarations: [
    HostDetailPage,
  ],
  imports: [
    IonicPageModule.forChild(HostDetailPage),
  ],
})
export class HostDetailPageModule {}
