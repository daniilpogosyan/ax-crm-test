import { EventMutationResolver } from './event.resolver';
import { EventMutationService } from './event.service';

export const eventMutationProviders = [
  EventMutationResolver,
  EventMutationService,
];
