import { Module } from '@nestjs/common';
import { LeadModule } from './modules/lead/lead.module';

@Module({
  imports: [LeadModule],
})
export class AppModule {}
