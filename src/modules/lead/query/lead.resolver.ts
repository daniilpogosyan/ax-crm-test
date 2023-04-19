import { PaginationArgs } from '@common/models/pagination';
import { Resolver, Query, Args } from '@nestjs/graphql';
import { LeadModel } from 'src/common/models';
import { FetchLeadArgs } from 'src/modules/lead/query/lead.dto';
import { LeadQueryService } from './lead.service';

@Resolver()
export class LeadQueryResolver {
  constructor(private readonly leadService: LeadQueryService) {}

  @Query(() => LeadModel)
  fetchLead(@Args() args: FetchLeadArgs) {
    return this.leadService.fetchLead(args);
  }

  @Query(() => [LeadModel])
  fetchLeads(@Args() args: PaginationArgs) {
    return this.leadService.fetchLeads(args);
  }
}
