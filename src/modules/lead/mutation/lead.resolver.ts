import { Resolver } from '@nestjs/graphql';
import { LeadMutationService } from './lead.service';

@Resolver()
export class LeadMutationResolver {
  constructor(private readonly leadService: LeadMutationService) {}
}
