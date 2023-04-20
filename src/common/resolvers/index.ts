import {
  LeadModelResolver,
  LeadStatusResolver,
} from '@common/resolvers/lead/lead.resolver';
import { Module } from '@nestjs/common';

@Module({
  providers: [LeadModelResolver, LeadStatusResolver],
})
export class ModelResolversModule {}
