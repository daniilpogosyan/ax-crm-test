import { Module } from '@nestjs/common';
import { LeadService } from './lead.service';
import { LeadResolver } from './lead.resolver';

@Module({
  providers: [LeadResolver, LeadService]
})
export class LeadModule {}
