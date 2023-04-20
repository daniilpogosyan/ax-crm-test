import { Resolver, Mutation, Args } from '@nestjs/graphql';
import { LeadModel } from 'src/common/models';
import {
  CreateLeadArgs,
  UpdateLeadArgs,
} from 'src/modules/lead/mutation/lead.dto';
import { LeadMutationService } from './lead.service';

@Resolver()
export class LeadMutationResolver {
  constructor(private readonly leadService: LeadMutationService) {}

  @Mutation(() => LeadModel)
  createLead(@Args() args: CreateLeadArgs) {
    return this.leadService.createLead(args);
  }

  @Mutation(() => LeadModel)
  updateLead(@Args() args: UpdateLeadArgs) {
    return this.leadService.updateLead(args);
  }
}
