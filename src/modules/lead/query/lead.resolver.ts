import { Resolver, Query } from '@nestjs/graphql';
import { LeadModel } from 'src/common/models';
import { LeadQueryService } from './lead.service';

@Resolver()
export class LeadQueryResolver {
  constructor(private readonly leadService: LeadQueryService) {}

  @Query(() => [LeadModel])
  fetchLeads() {
    return this.leadService.fetchLeads();
  }

  @Query(() => LeadModel)
  fetchLead() {
    return this.leadService.fetchLead();
  }
}
