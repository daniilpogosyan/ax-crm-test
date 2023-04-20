import { Module } from '@nestjs/common';
import { GeneralController } from 'src/modules/general/general.controller';
import { GeneralResolver } from './general.resolver';
import { GeneralService } from './general.service';

@Module({
  controllers: [GeneralController],
  providers: [GeneralService, GeneralResolver],
})
export class GeneralModule {}
