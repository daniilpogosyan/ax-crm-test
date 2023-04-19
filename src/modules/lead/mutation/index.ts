import { LeadMutationResolver } from './lead.resolver';
import { LeadMutationService } from './lead.service';

export const LeadMutationProviders = [
  LeadMutationResolver,
  LeadMutationService,
];
