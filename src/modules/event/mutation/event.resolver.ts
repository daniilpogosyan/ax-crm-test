import { Inject } from '@nestjs/common';
import { Resolver } from '@nestjs/graphql';
import { EventMutationService } from 'src/modules/event/mutation/event.service';

@Resolver()
export class EventMutationResolver {
  constructor(
    @Inject(EventMutationService) private eventService: EventMutationService,
  ) {}
}
