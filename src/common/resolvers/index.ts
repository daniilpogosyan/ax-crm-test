import { LeadModelResolver } from '@common/resolvers/lead/lead.resolver';
import { Module } from '@nestjs/common';

@Module({
  providers: [LeadModelResolver],
})
export class ModelResolversModule {}
