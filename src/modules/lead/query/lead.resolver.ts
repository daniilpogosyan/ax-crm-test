import { Resolver } from '@nestjs/graphql';
import { LeadQueryService } from './lead.service';

@Resolver()
export class LeadQueryResolver {
  constructor(private readonly leadService: LeadQueryService) {}
}
