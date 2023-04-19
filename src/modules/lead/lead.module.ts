import { Module } from '@nestjs/common';
import { LeadMutationProviders } from './mutation/index';
import { LeadQueryProviders } from './query/index';

@Module({
  providers: [...LeadMutationProviders, ...LeadQueryProviders],
})
export class LeadModule {}
