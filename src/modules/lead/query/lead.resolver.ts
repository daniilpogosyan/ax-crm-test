import { Resolver, Query } from '@nestjs/graphql';
import { LeadQueryService } from './lead.service';

@Resolver()
export class LeadQueryResolver {
  constructor(private readonly leadService: LeadQueryService) {}

  @Query(() => String)
  hello() {
    return 'Hello';
  }
}
