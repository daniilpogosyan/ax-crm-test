import { Resolver, Mutation } from '@nestjs/graphql';
import { LeadModel } from 'src/common/models';
import { LeadMutationService } from './lead.service';

@Resolver()
export class LeadMutationResolver {
  constructor(private readonly leadService: LeadMutationService) {}

  @Mutation(() => LeadModel)
  createLead() {
    return this.leadService.createLead();
  }

  @Mutation(() => LeadModel)
  updateLead() {
    return this.leadService.createLead();
  }
}
