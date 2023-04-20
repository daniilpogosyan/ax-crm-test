import { Module } from '@nestjs/common';
import { GeneralResolver } from './general.resolver';
import { GeneralService } from './general.service';

@Module({
  providers: [GeneralService, GeneralResolver],
})
export class GeneralModule {}
